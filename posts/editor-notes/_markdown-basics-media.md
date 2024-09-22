#### Links & Images

If you want to include your own figures, please upload figures from Github. Make sure the figure is at the same directory as the markdown file.

+---------------------------------------------------------------------------+---------------------------------------------------------------------------+
| Markdown Syntax                                                           | Output                                                                    |
+===========================================================================+===========================================================================+
| ``` markdown                                                              | <https://rave.wiki>                                                       |
| <https://rave.wiki>                                                       |                                                                           |
| ```                                                                       |                                                                           |
|                                                                           |                                                                           |
| link                                                                      |                                                                           |
+---------------------------------------------------------------------------+---------------------------------------------------------------------------+
| ``` markdown                                                              | [RAVE Website](https://rave.wiki)                                         |
| [RAVE Website](https://rave.wiki)                                         |                                                                           |
| ```                                                                       |                                                                           |
|                                                                           |                                                                           |
| link with different text                                                  |                                                                           |
+---------------------------------------------------------------------------+---------------------------------------------------------------------------+
| ``` markdown                                                              | ![Caption](rave-neuroimage.webp)                                          |
| ![Caption](rave-neuroimage.webp)                                          |                                                                           |
| ```                                                                       |                                                                           |
|                                                                           |                                                                           |
| image                                                                     |                                                                           |
+---------------------------------------------------------------------------+---------------------------------------------------------------------------+
| ``` markdown                                                              | ![Caption](rave-neuroimage.webp){width="30%"}                             |
| ![Caption](rave-neuroimage.webp){width="30%"}                             |                                                                           |
| ```                                                                       |                                                                           |
|                                                                           |                                                                           |
| image with 30% width                                                      |                                                                           |
+---------------------------------------------------------------------------+---------------------------------------------------------------------------+
| ``` markdown                                                              | [![Caption](rave-neuroimage.webp){width="30%"}](https://rave.wiki)        |
| [![Caption](rave-neuroimage.webp){width="30%"}](https://rave.wiki)        |                                                                           |
| ```                                                                       |                                                                           |
|                                                                           |                                                                           |
| image with link                                                           |                                                                           |
+---------------------------------------------------------------------------+---------------------------------------------------------------------------+
| ``` markdown                                                              | [![Caption](rave-neuroimage.webp "RAVE"){width="30%"}](https://rave.wiki) |
| [![Caption](rave-neuroimage.webp "RAVE"){width="30%"}](https://rave.wiki) |                                                                           |
| ```                                                                       |                                                                           |
|                                                                           |                                                                           |
| image with link and tooltip (hover text)                                  |                                                                           |
+---------------------------------------------------------------------------+---------------------------------------------------------------------------+
| ``` markdown                                                              | [![](missing-image.webp){width="30%" fig-alt="ss"}](https://rave.wiki)    |
| [![](missing-image.webp){width="30%" fig-alt="ss"}](https://rave.wiki)    |                                                                           |
| ```                                                                       |                                                                           |
|                                                                           |                                                                           |
| image with link: alt-text when image is missing                           |                                                                           |
+---------------------------------------------------------------------------+---------------------------------------------------------------------------+

#### Videos

You can include videos in documents using the `{{{< video >}}}` shortcode. For example, here we embed a YouTube video:

``` {.markdown shortcodes="false"}
{{< video https://www.youtube.com/watch?v=hfHZMfqIaGY >}}
```

Videos can refer to video files (e.g. MPEG) or can be links to videos published on YouTube, Vimeo, or Brightcove. Learn more in the article on [Videos](https://quarto.org/docs/authoring/videos.html).
