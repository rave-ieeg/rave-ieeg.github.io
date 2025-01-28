// Function to install a single package
async function qwebrInstallRPackage(packageName) {
  await mainWebR.evalRVoid(`webr::install('${packageName}');`);
}

// Function to load a single package
async function qwebrLoadRPackage(packageName) {
  await mainWebR.evalRVoid(`require('${packageName}', quietly = TRUE)`);
}

// Generic function to process R packages
async function qwebrProcessRPackagesWithStatus(packages, processType, displayStatusMessageUpdate = true) {
  // Switch between contexts
  const messagePrefix = processType === 'install' ? 'Installing' : 'Loading';

  // Modify button state
  qwebrSetInteractiveButtonState(`🟡 ${messagePrefix} package ...`, false);

  // Iterate over packages
  for (let i = 0; i < packages.length; i++) {
    const activePackage = packages[i];
    const formattedMessage = `${messagePrefix} package ${i + 1} out of ${packages.length}: ${activePackage}`;

    // Display the update in header
    if (displayStatusMessageUpdate) {
      qwebrUpdateStatusHeader(formattedMessage);
    }

    // Display the update in non-active areas
    qwebrUpdateStatusMessage(formattedMessage);

    // Run package installation
    if (processType === 'install') {
      await qwebrInstallRPackage(activePackage);
    } else {
      await qwebrLoadRPackage(activePackage);
    }
  }

  // Clean slate
  if (processType === 'load') {
    await mainWebR.flush();
  }
}

function makeRequest(xhr) {
  return new Promise(function (resolve, reject) {
      xhr.onload = function () {
          if (this.status >= 200 && this.status < 300) {
              resolve(xhr.response);
          } else {
              reject({
                  status: this.status,
                  statusText: xhr.statusText
              });
          }
      };
      xhr.onerror = function () {
          reject({
              status: this.status,
              statusText: xhr.statusText
          });
      };
      xhr.send();
  });
}

async function downloadFileContent(URL, headers = []) {
  const request = new XMLHttpRequest();
  request.open('GET', URL, true);
  request.responseType = 'arraybuffer';

  try {
    headers.forEach((header) => {
      const splitHeader = header.split(': ');
      request.setRequestHeader(splitHeader[0], splitHeader[1]);
    });
  } catch {
    const responseText = 'An error occurred setting headers in XMLHttpRequest';
    console.error(responseText);
    return { status: 400, response: responseText };
  }

  try {
    await makeRequest(request);
    const status = request.status;

    if (status >= 200 && status < 300) {
      return { status: status, response: request.response };
    } else {
      const responseText = new TextDecoder().decode(request.response);
      console.error(`Error fetching ${URL} - ${responseText}`);
      return { status: status, response: responseText };
    }
  } catch {
    return { status: 400, response: 'An error occurred in XMLHttpRequest' };
  }
}

// Start a timer
const initializeWebRTimerStart = performance.now();

// Encase with a dynamic import statement
globalThis.qwebrInstance = import(qwebrCustomizedWebROptions.baseURL + "webr.mjs").then(
  async ({ WebR, ChannelType }) => {
    // Populate WebR options with defaults or new values based on `webr` meta
    globalThis.mainWebR = new WebR(qwebrCustomizedWebROptions);

    // Initialization WebR
    await mainWebR.init();

    // Setup a shelter
    globalThis.mainWebRCodeShelter = await new mainWebR.Shelter();

    const promiseTasks = [];

    /** Added by Zhengjia to allow mounting data
     * @date: 2024-09-22
    /*/
    window.mainWebR = mainWebR;
    window.downloadFileContent = downloadFileContent;

    const doMount = async ({path, meta, data} = {}) => {
      if(
        typeof data === "string" &&
        typeof meta === "string" &&
        typeof path === "string"
      ) {
        console.log(`Mounting Data... (${path})`);
        qwebrUpdateStatusHeader(`Mounting Data... (${path})`);
        // Create mountpoint later
        // await mainWebR.FS.mkdir(path)

        // Download image data
        console.log(`const dataResp = await downloadFileContent('${ data }');`);
        const dataResp = await downloadFileContent(data);

        console.log(`const metaResp = await downloadFileContent('${ meta }');`);
        const metaResp = await downloadFileContent(meta);

        const _data = dataResp.response;

        const metaJSON = JSON.parse(new TextDecoder().decode(metaResp.response));
        console.log(metaJSON)

        const rootArray = new Uint8Array(_data);
        console.log(rootArray.length)

        const rootDir = await mainWebR.FS.lookupPath("/");
        console.log(rootDir)

        const ensureParentDirectory = async (filePath) => {
          const fpaths = filePath.split("/").filter(v => {
            return v.trim() !== "";
          });

          // remove filename
          const fileName = fpaths.pop();
          let cpath = "";
          let cdir = rootDir;

          for(let fname of fpaths) {
            cpath = `${cpath}/${fname}`;
            try {
              cdir = cdir.contents[ fname ];
              if( !cdir ) {
                try {
                  await mainWebR.FS.mkdir(cpath);
                } catch (e) {}
                cdir = await mainWebR.FS.lookupPath(cpath);
              }
            } catch (e) {
              try {
                await mainWebR.FS.mkdir(cpath);
                cdir = await mainWebR.FS.lookupPath(cpath);
              } catch (e) {
                // concurrent mkdir?
              }
            }
            if( !cdir.isFolder ) {
              throw new Error(`Path ${cpath} is not a folder.`);
            }
          }

          return `${cpath}/${fileName}`;
        }

        for(let ii = 0; ii < metaJSON.files.length; ii++) {
          const fileDescriptor = metaJSON.files[ ii ];
          try {
            let filePath = `${path}/${fileDescriptor.filename}`;
            filePath = filePath.replaceAll(/[\/]+/g, "/");
            console.log(`Extracting Data... (${filePath})`);
            qwebrUpdateStatusHeader(`Extracting Data... (${filePath})`);
            await ensureParentDirectory(filePath);
            const subArray = rootArray.subarray(fileDescriptor.start, fileDescriptor.end);
            await mainWebR.FS.writeFile(filePath, subArray);
          } catch (e) {
            console.error(e);
          }
        }

        console.log(`Done Mounting Data! (${path})`);
        qwebrUpdateStatusHeader(`Done Mounting Data! (${path})`);

        /*/ Mount image data
        const options = {
          packages: [{
            blob: new Blob([ dataResp.response ]),
            metadata: metaJSON,
          }],
        }
        // await mainWebR.FS.mount("WORKERFS", options, path);*/
      }
      return;
    };

    let mountDataList = [];
    if( qwebrMountDataList && !Array.isArray(qwebrMountDataList) && qwebrMountDataList === "object" ) {
      mountDataList.push(qwebrMountDataList);
    } else {
      mountDataList = qwebrMountDataList;
    }

    for(let ii = 0 ; ii < mountDataList.length; ii++) {
      await doMount(mountDataList[ ii ]);
    }

    /**
     * End webr mount
     */


    // Setup a pager to allow processing help documentation
    await mainWebR.evalRVoid('webr::pager_install()');
    await mainWebR.evalRVoid('webr::viewer_install()');

    // Override the existing install.packages() to use webr::install()
    await mainWebR.evalRVoid('webr::shim_install()');

    // Specify the repositories to pull from
    // Note: webR does not use the `repos` option, but instead uses `webr_pkg_repos`
    // inside of `install()`. However, other R functions still pull from `repos`.
    await mainWebR.evalRVoid(`
      options(
        webr_pkg_repos = c(${qwebrPackageRepoURLS.map(repoURL => `'${repoURL}'`).join(',')}),
        repos = c(${qwebrPackageRepoURLS.map(repoURL => `'${repoURL}'`).join(',')})
      )
    `);

    // Check to see if any packages need to be installed
    const setupRPackagesImpl = async () => {
      if (qwebrSetupRPackages) {
        // Obtain only a unique list of packages
        const uniqueRPackageList = Array.from(new Set(qwebrInstallRPackagesList));

        // Install R packages one at a time (either silently or with a status update)
        await qwebrProcessRPackagesWithStatus(uniqueRPackageList, 'install', qwebrShowStartupMessage)

        if (qwebrAutoloadRPackages) {
          // Load R packages one at a time (either silently or with a status update)
          await qwebrProcessRPackagesWithStatus(uniqueRPackageList, 'load', qwebrShowStartupMessage);
        }
      }
    }

    promiseTasks.push( setupRPackagesImpl() );
    await Promise.all( promiseTasks );

  }
);

// Stop timer
const initializeWebRTimerEnd = performance.now();
