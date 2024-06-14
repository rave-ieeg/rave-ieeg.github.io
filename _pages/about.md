---
layout: about
title: About
permalink: /
subtitle: 
cover:
  embed_demo_viewer: true
  image: RAVE_Cover.jpg
  message: >
    Welcome to RAVE!
  features: 
    - class: active
      text: >
        RAVE is free and open-source software framework for reproducible analysis and visualization of intracranial electroencephalogram (iEEG) data.
        <span class="hidden-on-screen-lt-600">
          Please <a href="#" onclick="threeBrain.nextStage()">click here to explore</a> the 3D viewer or <a href="?viewer=expand" target="_blank">interact with this demo <small><i class="fa-solid fa-up-right-from-square"></i></small></a> from a new window.
        </span>
  links:
    - text: Documentation
      type: btn-secondary btn-sm
      url: https://openwetware.org/wiki/RAVE
    - text: Install RAVE
      type: btn-sm
      url: \#installation
profile:
  align: right
  image: 
  image_circular: false # crops the image to make it circular
  more_info: > 
    <iframe width="480" height="270" src="https://www.youtube.com/embed/s6EnlqF-Q8E" title="RAVE Highlights" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

news: false # includes a list of news items
latest_posts: false
selected_papers: 
  enabled: true
  title: Publications
  description: >
    Send us your (p)reprint and we will add it to the list! 
social: false # includes social icons at the bottom of the page
---

RAVE is free and open-source software for the analysis of intracranial electroencephalogram (iEEG) data, including data collected using strips and grids (electrocorticography, ECoG) and depth electrodes (stereotactic EEG). A sister package to RAVE is the <a href="https://yael.wiki" target="_blank">YAEL electrode localization toolkit</a>.

RAVE is easy to use and creates publication-ready figures with absolutely no programming. RAVE can import standard data formats, including Matlab and EDF, and is compatible with BIDS-iEEG. It runs on laptops, lab servers, or in the cloud. Since all user interactions take place through a web browser, the user experience is identical on Mac, Windows and Linux. Data from RAVE can be exported for analysis using other software (<a href="https://openwetware.org/wiki/RAVE:SoftwareToolsTable" target="_blank">click here for a list of iEEG analysis tools</a>). Conversely, outside results can be imported and visualized using RAVE's visualization engine. RAVE provides templates to make it easy to create GUI-based analyses using the streamlined application programming interface.

Join our growing RAVE-iEEG community on Slack <i class="fab fa-slack"></i>. E-mail <a href="mailto://slack@rave.wiki">slack@rave.wiki</a> for an invitation. 

RAVE has been developed since 2017 with funding provided by NIH 5Tf	U01NS113339, 1R24MH117529. If you use RAVE for a publication, please cite: 

* Magnotti JF, Wang Z, Beauchamp MS. RAVE: comprehensive open-source software for reproducible analysis and visualization of intracranial EEG data. NeuroImage (2020) 223:117341. [[Click here for the journal full text](https://www.sciencedirect.com/science/article/pii/S1053811920308272)] [[Click here for the PDF](https://s3-us-west-2.amazonaws.com/oww-files-public/d/da/Magnotti_Wang_Beauchamp_Neuroimage2020_RAVE.pdf)] [[Click here for the preprint](https://biorxiv.org/cgi/content/short/2020.06.02.129676v1)].

If you use YAEL for electrode localization, please cite:

* Wang Z, Magnotti JF, Zhang X, Beauchamp MS. YAEL: Your Advanced Electrode Localizer. Eneuro. 2023 Oct 1;10(10). [[Click here for the journal full text](https://www.eneuro.org/content/10/10/ENEURO.0328-23.2023)] [[Click here for the PDF](https://www.eneuro.org/content/eneuro/10/10/ENEURO.0328-23.2023.full.pdf)].

### Installation

**Step 1: Install prerequisites**: 

* Click on this link to [install the prerequisites](https://openwetware.org/wiki/RAVE:Install_prerequisites).
<div class="alert alert-warning" role="alert">
❗The most common installation problem is that the prerequisites are not installed.
</div>

**Step 2: Install RAVE for the First Time**

If you have installed RAVE before, please check [How to update RAVE](https://openwetware.org/wiki/RAVE:Update).

1. Open the `R` application if it is not already open (`RStudio` may also be used). Copy and paste the following command into the `R` (or `RStudio`) console:
```r
install.packages('ravemanager', repos = 'https://rave-ieeg.r-universe.dev')
```
2. Copy and paste the following command into the `R` console:
```r
ravemanager::install()
```
Wait until you see the "Done finalizing installations!" message and the R Console command prompt reappears. This may take a few minutes depending on the speed of your internet connection. After installation, it is recommended to close all instances of `R` and restart `R`.
Common installation problems:

**Step 3: Install Isolated Python Environment (optional but recommended)**

* Copy and paste the following command into the `R` console:
```r
ravemanager::configure_python()
```
Some advanced RAVE features (such as CT to MRI alignment via nipy or ants) call Python libraries. To prevent conflicts with existing Python installations and ensure stability and reliability, this step uses miniconda to install an isolated Python environment and useful Python packages (numpy, scipy, jupyterlab, mne, nipy, pynwb, ants). If this step fails, proceed to the next step. 

**Step 4: Launch RAVE**

* Close all instances of `R` and restart `R`. Copy and paste the following command into the `R` console: 
```r
rave::start_rave2()
```

