
Pandoc supports numbering and formatting footnotes using the following syntax:

``` markdown
Here is a footnote reference,[^1] and another.[^longnote]

[^1]: Here is the footnote.

[^longnote]: Here's one with multiple blocks.

    Subsequent paragraphs are indented to show that they
belong to the previous footnote.

        { some.code }

    The whole paragraph can be indented, or just the first
    line.  In this way, multi-paragraph footnotes work like
    multi-paragraph list items.

This paragraph won't be part of the note, because it
isn't indented.
```

The above syntax generates the following output:

:::{.border .p-3}
Here is a footnote reference,[^1] and another.[^2]

This paragraph won't be part of the note, because it isn't indented.
:::

In addition, you can also write single paragraph footnotes inline using the following syntax:

``` markdown
Here is an inline note.^[Inlines notes are easier to write,
since you don't have to pick an identifier and move down to
type the note.]
```

This syntax generates the following output:

::: {.border .p-3}
Here is an inline note.[^3]
:::

The footnotes that are generated from the above examples are included in the [Example Footnotes](#example-footnotes) section at the bottom of the page. See the [Pandoc Footnotes](https://pandoc.org/MANUAL.html#footnotes) for additional information.

[^1]: Here is the footnote.

[^2]: Here's one with multiple blocks.

    Subsequent paragraphs are indented to show that they belong to the previous footnote.

        { some.code }

    The whole paragraph can be indented, or just the first line. In this way, multi-paragraph footnotes work like multi-paragraph list items.

[^3]: Inlines notes are easier to write, since you don't have to pick an identifier and move down to type the note.
