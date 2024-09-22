Use ```` ``` ```` to delimit blocks of source code:

```` markdown
```
code
```
````

Add a language to syntax highlight code blocks:

```` markdown
```r
rave::start_rave2()
```
````

```` markdown
```python
import numpy as np
```
````

Pandoc supports syntax highlighting for over [140 different languages](https://github.com/jgm/skylighting/tree/master/skylighting-core/xml). If your language is not supported then you can use the `default` language to get a similar visual treatment:

```` markdown
```default
code
```
````

