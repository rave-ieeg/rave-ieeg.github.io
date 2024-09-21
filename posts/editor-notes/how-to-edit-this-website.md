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

## 1. Create a new documentation

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

* Start a new line after `---`, and now you can begin editting the content (See Section "3. Edit markdown files" below on how to format your content).

## 2. Save the page

We all have experiences losing unsaved work. To avoid such frustration, it is a good practice to save the work before you regret. 

On Github, "saving the work" is called "Commit changes". To commit the pages you have just created, simply scroll up to the top of the editor, and you will see the button "Commit changes" with an outstanding color. Click on this button, make sure you commit ***directly*** to the main branch. If you have time, you are more than welcome to comment on the changes you made. This is a good practice in general for back-tracking the website history. However, commenting the change is completely optional.

## 3. Edit markdown files

This website is based on `Pandoc` and uses its variation of markdown as its underlying document syntax. Markdown is a plain text format that is designed to be easy to write, and, even more importantly, easy to read.

There are many tutorials on how to edit markdown files, for example, see [here](https://docs.github.com/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) and [there](https://quarto.org/docs/authoring/markdown-basics.html). Most of the time you only need to remember the basics such as text formatting, headings, list, links and images.

## 4. View the results

#### Preview during the editing

Github online editor provides a decent tool that allows you to preview the results before publishing changes. 
To preview the draft, scroll up to the top of the editor page, and you will see a `Preview` button right next to the `Edit` button. Click on `Preview` and the markdown results will show up. Click on `Edit` and the viewer will switch back.

#### View the final results

When you commit (save) the changes to the Github repository, an automatic bot will be dispatched to render the whole website. This process might take a while (usually several minutes) before you see the updates on the actual RAVE website. You can track the progress at [https://github.com/rave-ieeg/rave-ieeg.github.io/actions](https://github.com/rave-ieeg/rave-ieeg.github.io/actions)










