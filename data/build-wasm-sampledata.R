# Download webr repo to home folder
# brew install emscripten
# pak::pak("r-wasm/rwasm")
Sys.setenv(
  "WEBR_ROOT" = normalizePath("~/webr", mustWork = TRUE),
  "EMSCRIPTEN_ROOT" = "/opt/homebrew/Cellar/emscripten/4.0.1/libexec/"
)

library(rwasm)

setwd(rstudioapi::getActiveProject())

package_config <- list(
  list(
    source = "data_dir/",
    target = "project-demo-datadir"
  ),
  list(
    source = "raw_dir/",
    target = "project-demo-rawdir"
  ),
  list(
    source = "others/three_brain/fsaverage/",
    target = "project-demo-fsaverage"
  ),
  list(
    source = "others/three_brain/cvs_avg35_inMNI152/",
    target = "project-demo-mni152"
  ),
  list(
    source = "others/three_brain/N27/",
    target = "project-demo-n27"
  )
)

package_pair = function(pair) {
  setwd(file.path(rstudioapi::getActiveProject(), "data/wasm/samples/"))
  message(pair$source, " -> ../../rave_data/", pair$target)

  # remove all the .DS_Store or hidden files
  fs <- list.files(
    pair$source,
    pattern = "^\\.",
    all.files = TRUE,
    full.names = TRUE,
    recursive = TRUE,
    include.dirs = FALSE
  )
  sum(unlist(lapply(fs, unlink)), 0)

  # sits at where data is stored
  system2(
    '/opt/homebrew/Cellar/emscripten/4.0.1/libexec/tools/file_packager',
    c(sprintf('%s_orig.data', pair$target),
      '--preload',
      sprintf("../../rave_data/%s", pair$source),
      '--separate-metadata',
      sprintf("--js-output='%s_orig.js'", pair$target))
  )

  dir.create(sprintf('%s.js.metadata', pair$target))
  dir.create(sprintf('%s.data', pair$target))

  file.copy(sprintf('%s_orig.js.metadata', pair$target), file.path(sprintf('%s.js.metadata', pair$target), "content"), overwrite = TRUE)
  file.copy(sprintf('%s_orig.data', pair$target), file.path(sprintf('%s.data', pair$target), "content"), overwrite = TRUE)

  # no need to keep the js
  unlink(sprintf('%s_orig.js', pair$target))
  unlink(sprintf('%s_orig.js.metadata', pair$target))
  unlink(sprintf('%s_orig.data', pair$target))
  # rwasm::file_packager(
  #   in_dir = pair$source,
  #   out_dir = dirname(pair$target),
  #   out_name = basename(pair$target),
  #   compress = FALSE
  # )
}


lapply(package_config, package_pair)
setwd(rstudioapi::getActiveProject())

dir.create("./_freeze/data/wasm/", showWarnings = FALSE, recursive = TRUE)
file.copy("./data/wasm/samples/", "./_freeze/data/wasm/", overwrite = TRUE, recursive = TRUE)


dir.create("./_site/data/wasm/", showWarnings = FALSE, recursive = TRUE)
file.copy("./data/wasm/samples/", "./_site/data/wasm/", overwrite = TRUE, recursive = TRUE)
