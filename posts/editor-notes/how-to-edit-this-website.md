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

-   To add a new documentation page, open <https://github.com/rave-ieeg/rave-ieeg.github.io/tree/main/posts>. Please select a proper folder for the document, click on "Add File" button (see Figure 1), and click on "Create new file".

    ![Figure 1: Screenshot of Github buttons to create a new file.](figure-create-new-file.png){width="100%"}

-   Github will open its online editor. The first thing to do is to give your new baby a good name, which should start with letters (`a-z` or `A-Z`) and often end with file extension `.md` (stands for "Markdown" format).

    ![Figure 2: Create a new file name: avoid special letters especially `/` in the file name (unless you want to create a folder). Filenames starting with `_` will be "hidden" markdown snippets that will not be rendered as a page. However, it can be included in other documents (see Section "[3. Edit markdown files]" below).](figure-name-your-file.png){width="100%"}

-   After choosing the file name, copy the following meta header into the content box. Make sure you copy the entire header (including "`---`"). Edit the key information such as `title`, `description`, `date`, `author`, and `categories` as they will affect how the page is arranged and displayed in the [Documentation](/blogs.html) page.

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

-   Start a new line after the second dash "`---`", and now you can begin editing the content (See Section "[3. Edit markdown files]" below on how to format your content).

## 2. Save the page

We all have experienced losing unsaved work. To avoid such frustration, it is a good practice to save the page before you regret.

On Github, "saving the work" is called `Commit changes`. To commit the pages you have just created, simply scroll up to the top of the editor, and you will see the button `Commit changes` with an outstanding color (green?). Click on this button, please ensure that the commit is made ***directly*** to the main branch. You are more than welcome to comment on the changes. For example, "This is my first page!", "I feel fantastic", or "The best Philly cheese steak I've ever had was in Houston" for back-tracking the website history. However, comment is completely optional.

## 3. Edit markdown files

This website is based on `Pandoc` and uses its variation of markdown as its underlying document syntax. Markdown is a plain text format that is designed to be easy to write, and, even more importantly, easy to read.

There are many tutorials on how to edit markdown files, for example, see [here](https://docs.github.com/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) and [there](https://quarto.org/docs/authoring/markdown-basics.html). Most of the time you only need to remember the basics such as text formatting, headings, list, links and images.

## 4. View the results


#### Preview during the editing

Github online editor provides a decent tool for previewing the results before publishing changes. This feature allows you to test different formatting ideas before saving changes. To preview the page, scroll up to the top of the editor and click on the `Preview` button right next to `Edit`. The markdown pre-render results will show up. To continue editing the pages, click on `Edit` button and the viewer will switch back.

|                       "Edit" mode                        |                         "Preview" mode                          |
|:----------------------------------:|:----------------------------------:|
| ![Left: "Edit" mode](figure-edit-mode.png){width="100%"} | ![Right: "Preview" mode](figure-preview-mode.png){width="100%"} |

#### View the final results

When you commit (save) the changes to the Github `main` repository branch, an Github bot will be invoked to render the whole website. This process is completely automatic and normally requires no manual intervention. Here is the link if you would like to track the progress out of curiosity: <https://github.com/rave-ieeg/rave-ieeg.github.io/actions>. The rendering process usually costs several minutes before the updates are deployed to RAVE website.

![Screenshot of RAVE website automatic building process.](figure-github-action.png){fig-align="left" width="50%"}
