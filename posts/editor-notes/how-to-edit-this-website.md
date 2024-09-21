---
title: "How to Edit this Website"
description: |
  Editor's notes on how to edit this website
date: 2024-09-01
author: 
  - name: Zhengjia Wang
    affiliations: 
      - name: "Dept. of Neurosurgery, University of Pennsylvania"
categories:
  - "Editor's Notes"
copyright: 
  holder: Beauchamp's Lab
  year: 2024
---

This post is an introduction on how to edit the website (rave.wiki), which completely runs on Github with no dedicated hosting servers.

To start, you must have a Github account and must apply to be a member of [`rave-ieeg`](https://github.com/rave-ieeg/) group. 

## Create a new documentation

All the documentation files are stored at directory [posts/](https://github.com/rave-ieeg/rave-ieeg.github.io/tree/main/posts), which contains several folders that roughly classify the documents. 

* To add a new documentation page, open [https://github.com/rave-ieeg/rave-ieeg.github.io/tree/main/posts](https://github.com/rave-ieeg/rave-ieeg.github.io/tree/main/posts). Please select a proper folder for the document, click on "Add File" button (see Figure 1), and click on "Create new file".

![Screenshot of Github buttons to create a new file.](figure-create-new-file.png)

* Github will open its online editor. The first thing to do is to give your new baby a good name, which should start with letters (`a-z` or `A-Z`) and often end with file extension `.md` (stands for "Markdown" format).

* After choosing the file name, copy the following meta header into the content box. Make sure you edit the key information such as `title`, `description`, `date`, `author`, and `categories` as they will affect how the page is sorted and displayed in the [Documentation](/blogs.html) page.

```
---
title: "How to Edit this Website"
description: |
  Editor's notes on how to edit this website
date: 2024-09-01
author: 
  - name: Zhengjia Wang
    affiliations: 
      - name: "Dept. of Neurosurgery, University of Pennsylvania"
categories:
  - "Editor's Notes"
copyright: 
  holder: Beauchamp's Lab
  year: 2024
---
```

* Start a new line after `---`, and now you can begin editting the content.




