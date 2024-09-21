
### 0. Check if you are logged into an admin account

MacOS requires users to have administrator (admin) privileges to install applications. At several points during the installation, MacOS will ask for your account password to verify installation. Installation will fail if your MacOS account doesn't have admin privileges.

> How to check if I have an admin account?

Open `Terminal` (in the /Applications/Utilities folder). Copy the command line shown below into the terminal window.

``` sh
 sudo ls
```

You will be prompted for a password. This is the password of the MacOS account you are logged in as. If you have an admin account, MacOS will show the files in the current directory. If not, you will receive an error message. Alternately, click anywhere on the desktop to activate the MacOS menu bar, click on the Apple icon at the top left of the menu bar, then "System Preferences" or "System Settings", then "Users & Groups". Find your current account and verify that it has admin privileges.

> What if I don't have an admin account?

You will need to create a new account with admin privileges or change the privileges of your current account, see https://support.apple.com/guide/mac-help/change-users-groups-settings-mtusr001/mac . If your computer is administered by others, ask them to create an admin account for you.

### 1. Install R, version 4 or higher

[Click here to install the latest version of the R language for Mac](https://cran.r-project.org/bin/macosx/ "Official Website to Download R"){target="_blank"}. Find the latest package (.pkg) file, click to download, then open and install. There are different versions of R for older Macs with Intel CPUs and newer Macs with Apple CPUs (M1/M2). Choose the correct version, either "Intel 64-bit" or "Apple silicon ARM64".

***To verify R installation***: R will be installed in the /Applications folder. Open this folder and double-click on the R icon to start R. After starting R, we recommend that you right-click on the R icon in the Dock and select "Options"/"Keep in Dock" to make it easier to launch with a single click. We also recommend starting R, opening the "Preferences"/"Startup" tab, and change "Save workspace on exit from "R" to "No". Uncheck the box "Read history file on startup". To check the current version of "R", start R and enter the following into the console:

``` r
R.version
```

This will produce a number of lines of output, beginning with something like

```         
 platform       x86_64-apple-darwin17.0     
 arch           x86_64
```

### 2. homebrew package manager

Installation requires the latest version of the [`homebrew`](http://brew.sh/){target="_blank"} package manager. Open `Terminal` (in the /Applications/Utilities folder). Copy the command line shown below into the terminal window.

``` sh
/usr/bin/env bash
```

Copy the line below into the terminal window.

``` sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

This step will take several minutes to complete. Wait until the installation is finished and the command prompt reappears before moving to the next step.

***Add brew to your path or the next installation steps will fail***. The installer provides the necessary command lines in the Terminal window at the conclusion of the previous step. Execute them in the same terminal window by copying and pasting. They will look something like

``` sh
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

These commands will not produce any output.

To verify brew installation: Copy the command line shown below into the terminal window.

``` sh
brew --version
```

Should produce a result like

```         
 Homebrew 3.4.1
 Homebrew/homebrew-core (git revision f03c984ad7; last commit 2022-03-08)
```

### 3. Install libraries using brew

Enter this command into the terminal window:

``` sh
brew install hdf5 fftw pkg-config cmake libpng
```

This step will install the `hdf5` (high-performance file system), `fftw` (fast-fourier transform library), `pkg-config` (package configuration toolbox), `cmake` (cross-platform make for compiling optional packages such as ant), `libpng` (library for manipulating png images) and takes several minutes to complete. Wait until the installation is finished and the command prompt reappears before moving to the next step.

### 4. Finished with prerequisites

Scroll to the top of the page and click on the "Install" tab to return to the full installation guide.

### 5. Troubleshooting

You may receive this message

```         
 Warning: macOS is reporting that you have not yet agreed to the Xcode license. This can occur if Xcode has been updated or reinstalled (e.g. as part of a macOS update). Some features (e.g. Git / SVN) may be disabled.
```

To make this error go away, open the `Terminal` app in the Applications folder, enter

``` sh
sudo xcodebuild -license accept
```

Then restart `RStudio`. [A helpful article in case of XCode installation errors](https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/){target="_blank"}.

If the XCode download from the RStudio install in step 2 fails, install the command line tools manually. First, download XCode. Click "GET" (if instead you see "OPEN", then Xcode is already installed.) Open the `Terminal` app in the Applications folder, enter

``` sh
xcode-select --install
```

Click "yes" to proceed with installing the command-line tools. The message "xcode-select: error: command line tools are already installed" means that you can proceed.
