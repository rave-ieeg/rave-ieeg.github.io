---
title: "Installation Guide"
description: |
  Try RAVE today!
date: 2024-09-14
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

## Step 1: Install prerequisites

::: {.alert .alert-warning role="alert"}
Please read and install the prerequisites.

❗The most common installation problem is that the prerequisites are not installed.❗

:::

Choose your operating system:

```{=html}
<!-- 
  1. Go to `_prerequisite_xxx.md` to edit the prerequisites for xxx
  2. The wrapper layer turns the content into modal ;D
    `data-class` controls the button style
    `data-label` is the button text
    `data-title` is the modal title
-->
```
::: {.rave-modal data-type="botton" data-class="btn btn-primary" data-label="MacOS" data-title="Prerequisite on MacOS"}
{{< include _prerequisite_macos.md >}}
:::

::: {.rave-modal data-type="botton" data-class="btn btn-primary" data-label="Windows" data-title="Prerequisite on Windows"}
{{< include _prerequisite_windows.md >}}
:::

::: {.rave-modal data-type="botton" data-class="btn btn-primary" data-label="Ubuntu Linux" data-title="Prerequisite on Ubuntu Linux"}
{{< include _prerequisite_ubuntu.md >}}
:::

## Step 2: Install RAVE for the First Time

If you have installed RAVE before, please check [How to update RAVE](./update.md "How to update RAVE").

1.  Open the `R` application if it is not already open (`RStudio` may also be used). Copy and paste the following command into the `R` (or `RStudio`) console:

``` r
install.packages('ravemanager', repos = 'https://rave-ieeg.r-universe.dev')
```

2.  Copy and paste the following command into the `R` console:

``` r
ravemanager::install()
```

Wait until you see the "Done finalizing installations!" message and the R Console command prompt reappears. This may take a few minutes depending on the speed of your internet connection. After installation, it is recommended to close all instances of `R` and restart `R`.

::: {.rave-modal data-type="botton" data-class="btn btn-outline-primary" data-label="Common installation problems" data-title="Common installation problems"}
{{< include _installation_problems.md >}}
:::

## Step 3: Launch RAVE

Copy and paste the following command into the `R` console:

``` r
rave::start_rave2()
```

In a few seconds a web browser window showing RAVE should appear. Success! Explore RAVE by clicking on one of the module names on the left-hand side such as "Subject 3D Viewer" to view a brain or "Power Explorer" to view sample iEEG data.

## Step 4 (optional but recommended): Install Isolated Python Environment

Copy and paste the following command into the "R" console:

``` r
ravemanager::configure_python()
```

Some advanced RAVE features (such as CT to MRI alignment via `ANTs`) call Python libraries. To prevent conflicts with existing Python installations and ensure stability and reliability, this step uses `Miniconda` to install an isolated Python environment and useful Python packages (`numpy`, `scipy`, `jupyterlab`, `mne`, `pynwb`, `antspyx`).
