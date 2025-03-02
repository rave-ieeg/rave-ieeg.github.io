---
title: Documentations & Examples
listing:
  - id: quick-access
    contents: posts/installation
    type: table
    sort-ui: false
    filter-ui: false
    sort: "date asc"
    table-hover: true
    fields:
      - title
      - description
      - reading-time
  - id: full-listings
    contents: posts
    type: grid
    sort: "date desc"
    categories: true
    sort-ui: true
    filter-ui: true
    page-size: 9
    grid-columns: 3
    table-hover: true
    exclude:
      categories: 
        - Installation
        - Editor Notes
    fields:
      - image
      - title
      - description
      - reading-time
      - categories
      - date
execute:
  freeze: false
page-layout: full
title-block-banner: true
---

## Installation

::: {#quick-access}
:::

## Examples

::: {#full-listings}
:::
