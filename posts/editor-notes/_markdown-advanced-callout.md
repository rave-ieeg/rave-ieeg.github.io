
#### Callout

Callouts are an excellent way to draw extra attention to certain concepts, or to more clearly indicate that certain content is supplemental or applicable to only some scenarios.

There are five different types of callouts available.

-   `note`
-   `warning`
-   `important`
-   `tip`
-   `caution`

The color and icon will be different depending upon the type that you select. Here are what the various types look like in HTML output:

::: {.callout-note}
Note that there are five types of callouts, including: `note`, `tip`, `warning`, `caution`, and `important`.
:::

::: {.callout-warning}
Callouts provide a simple way to attract attention, for example, to this warning.
:::

::: {.callout-important}
## This is Important

Danger, callouts will really improve your writing.
:::

::: {.callout-tip}
## Tip With Title

This is an example of a callout with a title.
:::

::: {.callout-caution collapse="true"}
## Expand To Learn About Collapse

This is an example of a 'collapsed' caution callout that can be expanded by the user. You can use `collapse="true"` to collapse it by default or `collapse="false"` to make a collapsible callout that is expanded by default.
:::

## Markdown Syntax

Create callouts in markdown using the following syntax (note that the first markdown heading used within the callout is used as the callout heading):

``` markdown
::: {.callout-note}
Note that there are five types of callouts, including:
`note`, `warning`, `important`, `tip`, and `caution`.
:::

::: {.callout-tip}
## Tip with Title

This is an example of a callout with a title.
:::

::: {.callout-caution collapse="true"}
## Expand To Learn About Collapse

This is an example of a 'folded' caution callout that can be expanded by the user. You can use `collapse="true"` to collapse it by default or `collapse="false"` to make a collapsible callout that is expanded by default.
:::
```

Note that above callout titles are defined by using a heading at the top of the callout. If you prefer, you can also specify the title using the `title` attribute. For example:

```markdown
::: {.callout-tip title="Tip with Title"}
This is a callout with a title.
:::
```

##### Customizing Appearance

###### Collapse

You can create 'folded' callouts that can be expanded by the user by settings the `collapse` attribute on the callout. If you set `collapse=true`, the callout will be expandable, but will be collapsed by default. If you set `collapse=false`, the callout will be expandable, but will be expanded by default.

###### Appearance

Callouts have 3 different looks you can use.

|           |                                                                                                                 |
|-----------|-----------------------------------------------------------------------------------------------------------------|
| `default` | The default appearance with colored header and an icon.                                                         |
| `simple`  | A lighter weight appearance that doesn't include a colored header background.                                   |
| `minimal` | A minimal treatment that applies borders to the callout, but doesn't include a header background color or icon. |