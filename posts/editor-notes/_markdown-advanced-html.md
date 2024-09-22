#### Raw content without parsing

Raw content can be included directly without parsing it. A raw block starts with ` ```{=` followed by a format and closing `}`, e.g. here's a raw HTML block:

`````` markdown
```{=html}
<iframe src="https://rave.wiki/" width="500" height="400"></iframe>
```
``````


#### Divs and Spans

For HTML `<div>` and `<span>` tags, there is a better option. 
You can add classes, attributes, and other identifiers to regions of content using Divs and Spans. The difference between this type and "raw" content above is that the content inside `:::` will be parsed as markdown.

For example, here we add the "border" class to a region of content using a div (`:::`):

``` markdown
::: {.border}
This content can be styled with a border
:::
```

Once rendered to HTML, Quarto will translate the markdown into:

``` html
<div class="border">
  <p>This content can be styled with a border</p>
</div>
```

Divs start with a fence containing at least three consecutive colons plus some attributes. The attributes may optionally be followed by another string of consecutive colons. The Div ends with another line containing a string of at least three consecutive colons. The Div should be separated by blank lines from preceding and following blocks. Divs may also be nested. For example

``` markdown
::::: {#special .sidebar}

::: {.warning}
Here is a warning.
:::

More content.
:::::
```

Once rendered to HTML, Quarto will translate the markdown into:

``` html
<div id="special" class="sidebar">
  <div class="warning">
    <p>Here is a warning.</p>
  </div>
  <p>More content.</p>
</div>
```

Fences without attributes are always closing fences. Unlike with fenced code blocks, the number of colons in the closing fence need not match the number in the opening fence. However, it can be helpful for visual clarity to use fences of different lengths to distinguish nested divs from their parents.

A bracketed sequence of inlines, as one would use to begin a link, will be treated as a `Span` with attributes if it is followed immediately by attributes:

``` markdown
[This is *some text*]{.class key="val"}
```

Once rendered to HTML, Quarto will translate the markdown into:

``` html
<span class="class" data-key="val">
  This is <em>some text</em>
</span>
```


