
When a document is too long, it is a good practice to break it down into several small snippets.

For example, the main source of this document [`how-to-edit-this-website.md`](https://github.com/rave-ieeg/rave-ieeg.github.io/blob/main/posts/editor-notes/how-to-edit-this-website.md) only has around 200 lines. Most of the formatting details are separated out into small snippets.

To create a snippet, simply create a markdown document whose name starts with an underscore `_`. For example `_markdown-advanced-snippet.md` is the file name of text you are reading. Each document snippet is just a normal `markdown` file. They can be independently edited.

To include the snippet into the main document, you can use the following markdown:

``` markdown
{{{< include _markdown-advanced-snippet.md >}}}
```

Document snippets work well with callouts and pop-up modals. 

* Here's an [example using callouts](https://github.com/rave-ieeg/rave-ieeg.github.io/blob/8bc076e6cd3fa71e5b3eba27ef76ce2b8b29f26f/posts/editor-notes/how-to-edit-this-website.md?plain=1#L144-L148)
  
  ``` markdown
  ::: {.callout collapse="true" appearance="simple"}
  ### Document `{`snippets`}` 
    
  {{{< include _markdown-advanced-snippet.md >}}}
  :::
  ```
  
* This is an example [using pop-up modal](https://github.com/rave-ieeg/rave-ieeg.github.io/blob/8bc076e6cd3fa71e5b3eba27ef76ce2b8b29f26f/posts/from_wiki/installation.md?plain=1#L40C1-L42C4)

  ``` markdown
  ::: {.rave-modal data-type="botton" data-class="btn btn-primary" data-label="MacOS" data-title="Prerequisite on MacOS"}
  {{{< include _prerequisite_macos.md >}}}
  :::
  ```
