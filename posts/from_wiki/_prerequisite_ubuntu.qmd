
> If you encounter difficulties, email [help@rave.wiki](mailto:help@rave.wiki).

To install R, please go to [https://cran.r-project.org/](https://cran.r-project.org/){target="_blank"} and read installation guide for Linux system. The following guide is for Ubuntu 20.x (x86_64) system. Please do **ALWAYS** read R's official installation guide.

### 1. Add R-Cran repository to your app list:

Open terminal (if you don't know how, look at your sidebar in Ubuntu, `search your computer` enter `terminal`, and open it), type the following code:

```sh
# update indices
sudo apt update -qq
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
```

### 2. Install R

Copy the following command line by line into your terminal and run

```sh
sudo apt-get install r-base r-base-dev
```

### 3. Type and enter "R" your terminal. This launches R from your terminal.

Copy the following command line by line into your terminal and run

```r
install.packages('ravemanager', repos = 'https://rave-ieeg.r-universe.dev')
ravemanager::system_requirements(sudo = TRUE)
```

If your operating system is supported, it will print out all the system libraries needed.

### 4. Install compiling tools and system dependencies

Open a new terminal window, copy the installation script generated from the last step into this new window. For example, on Ubuntu 20.x,

```sh
sudo apt-get install -y build-essential file git psmisc procps sudo wget make cmake \
 libsodium-dev libffi-dev libbz2-dev libpcre2-dev libcairo2-dev libssh2-1-dev libtiff5-dev libv8-dev \
 libicu-dev zlib1g-dev libcurl4-openssl-dev libssl-dev libfontconfig1-dev libfreetype6-dev \
 libfribidi-dev libharfbuzz-dev libjpeg-dev libpng-dev libtiff-dev pandoc libxml2-dev git libgit2-dev \
 libfftw3-dev libhdf5-dev libglpk-dev libgmp3-dev libzmq3-dev python3
```

The packages `libv8-dev` is for `V8` package to enable JavaScript. `libxml2-dev` is for `xml2`. `libfftw3-dev` `libtiff5-dev` are necessary for fast-fourier transformations and `libhdf5-dev` is for reading and writing data in open data format `HDF5`. All the other packages are necessary for `devtools` (compilers)


### 5. Install the free version of RStudio Desktop here:

Go to [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/){target="_blank"} and download one with keywords "Ubuntu xxx/Debian xxx" (depending on your system version), move the downloaded file to your **desktop**, rename it "rstudio.deb".

Open terminal, type the following command in your terminal

```sh
cd ~/Desktop
sudo dpkg -i ./rstudio.deb 
```

and `RStudio` should be in your application list. If not, look at your sidebar in Ubuntu, click **search your computer** and enter "RStudio". 

