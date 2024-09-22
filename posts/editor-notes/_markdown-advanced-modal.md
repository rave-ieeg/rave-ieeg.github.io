
Modal is a great way to show dialogues with a catchy button. Here is an example:


``` markdown
::: {.rave-modal data-type="botton" data-class="btn btn-primary" data-label="Click me!" data-title="I am the title!"}

RAVE is a very powerful tool!

:::
```

Output:

::: {.rave-modal data-type="botton" data-class="btn btn-primary" data-label="Click me!" data-title="I am the title!"}

RAVE is a very powerful tool!

:::

Explanation:

* Element class `.rave-modal` will let this website mark the content as modal content;
* `data-type="botton"` creates a button;
* `data-label` will become the button label;
* `data-title` is the title of pop-up dialogue;
* `data-class="btn btn-primary"` styles the button with [solid primary background]{.badge .text-bg-primary}. Common styles are:
  * Normal
  
    [data-class="btn btn-primary"]{.btn .btn-primary}
    [data-class="btn btn-secondary"]{.btn .btn-secondary}
    [data-class="btn btn-success"]{.btn .btn-success}
    [data-class="btn btn-danger"]{.btn .btn-danger}
    [data-class="btn btn-warning"]{.btn .btn-warning}
    [data-class="btn btn-info"]{.btn .btn-info}
    [data-class="btn btn-light"]{.btn .btn-light}
    [data-class="btn btn-dark"]{.btn .btn-dark}
    
  * Outlined
  
    [data-class="btn btn-outline-primary"]{.btn .btn-outline-primary}
    [data-class="btn btn-outline-secondary"]{.btn .btn-outline-secondary}
    [data-class="btn btn-outline-success"]{.btn .btn-outline-success}
    [data-class="btn btn-outline-danger"]{.btn .btn-outline-danger}
    [data-class="btn btn-outline-warning"]{.btn .btn-outline-warning}
    [data-class="btn btn-outline-info"]{.btn .btn-outline-info}
    [data-class="btn btn-outline-light"]{.btn .btn-outline-light}
    [data-class="btn btn-outline-dark"]{.btn .btn-outline-dark}
    
  * Size
  
    [data-class="btn btn-lg btn-primary"]{.btn .btn-lg .btn-primary}
    [data-class="btn btn-sm btn-primary"]{.btn .btn-sm .btn-primary}


Here is an example of customization:

``` markdown
* ::: {.rave-modal data-type="span" data-class="text-decoration-underline" data-label="Click this link to show the message!" data-title="Hello World!"}
  RAVE is a very powerful tool!
  :::
* ::: {.rave-modal data-type="span" data-class="text-decoration-underline" data-label="How about this one?" data-title="Hello Again!"}
  RAVE is indeed a very powerful tool!
  :::
```

Output:

* ::: {.rave-modal data-type="span" data-class="text-decoration-underline" data-label="Click this link to show the message!" data-title="Hello World!"}
  RAVE is a very powerful tool!
  :::
* ::: {.rave-modal data-type="span" data-class="text-decoration-underline" data-label="How about this one?" data-title="Hello Again!"}
  RAVE is indeed a very powerful tool!
  :::
