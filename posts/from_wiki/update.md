---
title: "Updating and Upgrading Guide"
description: |
  Update RAVE today!
date: 2024-09-15
execute:
  freeze: auto
author: 
  - name: Zhengjia Wang, John Magnotti, Xiang Zhang, Michael Beauchamp
    affiliations: 
      - name: "Dept. of Neurosurgery, University of Pennsylvania"
categories:
  - "Installation"
copyright: 
  holder: Beauchamp's Lab
  year: 2024
---

Because RAVE runs on top of R and RStudio, it is important to update both of these before updating RAVE. For major updates (about every 6-12 months) it is necessary to completely reinstall:

Click here to see instructions on 

::: {.rave-modal data-type="botton" data-class="btn btn-outline-primary" data-label="MacOS" data-title="Upgrade R, RStudio, Homebrew on MacOS"}
{{< include _prerequisite_macos.md >}}
:::

::: {.rave-modal data-type="botton" data-class="btn btn-outline-primary" data-label="Windows" data-title="Upgrade R, RTools on Windows"}
{{< include _prerequisite_windows.md >}}
:::

::: {.rave-modal data-type="botton" data-class="btn btn-outline-primary" data-label="Ubuntu Linux" data-title="Upgrade R and system dependencies on Linux"}
{{< include _prerequisite_ubuntu.md >}}
:::

------------------------------------------------------------------------------

For minor updates, start RStudio, "Help"/"Check for Updates"; start R, "R"/"Check For R Updates"). 

If you have a RAVE version older than October 2022, you must first enter the following command into the R console (if you are not sure, it is OK to run it just in case). 

```r
lib_path <- Sys.getenv("RAVE_LIB_PATH", unset = Sys.getenv("R_LIBS_USER", unset = .libPaths()[[1]]))
install.packages('ravemanager', repos = 'https://rave-ieeg.r-universe.dev', lib = lib_path)
```

Regardless of your current RAVE version, enter the following command into the R console:

```r
ravemanager::version_info()
```

This prints out current RAVE package versions. If all the core packages are up-to-date, you will see the message "Everything is up to date", otherwise please follow the following steps. Quit all instance of `R` and `RStudio` before proceeding, or RAVE will not be able to update. Restart R and enter the following command into the R console :

```r
lib_path <- Sys.getenv("RAVE_LIB_PATH", unset = Sys.getenv("R_LIBS_USER", unset = .libPaths()[[1]]))
loadNamespace("ravemanager", lib.loc = lib_path)
ravemanager::update_rave()
```

Press "enter" if you are asked "yes/no/cancel".

After this command completes, quit and restart RStudio. Then restart the updated RAVE: 

```r
rave::start_rave2()
```

Notes: Be sure to quit ALL other running R and RStudio instances before running "ravemanager::update_rave()", otherwise packages will be locked and upgrade will fail. For other problems, the fallback is to completely reinstall RAVE. 
