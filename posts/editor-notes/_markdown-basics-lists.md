+-----------------------------------+---------------------------------+
| Markdown Syntax                   | Output                          |
+===================================+=================================+
| ``` markdown                      |                                 |
| * unordered list                  | * unordered list                |
|     + sub-item 1                  |     + sub-item 1                |
|     + sub-item 2                  |     + sub-item 2                |
|         - sub-sub-item 1          |         - sub-sub-item 1        |
| ```                               |                                 |
+-----------------------------------+---------------------------------+
| ``` markdown                      |                                 |
| *   item 2                        | -   item 2                      |
|                                   |                                 |
|     Continued (indent 4 spaces)   |     Continued (indent 4 spaces) |
| ```                               |                                 |
+-----------------------------------+---------------------------------+
| ``` markdown                      |                                 |
| 1. ordered list                   |  1. ordered list                |
| 2. item 2                         |  2. item 2                      |
|     i) sub-item 1                 |      i) sub-item 1              |
|          A.  sub-sub-item 1       |           A.  sub-sub-item 1    |
| ```                               |                                 |
+-----------------------------------+---------------------------------+
| ``` markdown                      |                                 |
| - [ ] Task 1                      | - [ ] Task 1                    |
| - [x] Task 2                      | - [x] Task 2                    |
| ```                               |                                 |
+-----------------------------------+---------------------------------+
| ``` markdown                      |                                 |
| (@)  A list whose numbering       |  (1) A list whose numbering     |
|                                   |                                 |
| continues after                   |  continues after                |
|                                   |                                 |
| (@)  an interruption              |  (2) an interruption            |
| ```                               |                                 |
+-----------------------------------+---------------------------------+
| ``` markdown                      |                                 |
| ::: {}                            | ::: {}                          |
| 1. A list                         | 1. A list                       |
| :::                               | :::                             |
|                                   |                                 |
| ::: {}                            | ::: {}                          |
| 1. Followed by another list       | 1. Followed by another list     |
| :::                               | :::                             |
| ```                               |                                 |
+-----------------------------------+---------------------------------+
| ``` markdown                      |                                 |
| term                              | term                            |
| : definition                      | : definition                    |
| ```                               |                                 |
+-----------------------------------+---------------------------------+

Note that unlike other Markdown renderers (notably Jupyter and GitHub), lists in rave.wiki require an entire blank line above the list. Otherwise the list will not be rendered in list form, rather it will all appear as normal text along a single line.
