# cl-djula-svg

A Common Lisp package that will help process SVG files and copy them to folders
so that they can be used in [Djula]() templates in a [Caveman]() web application framework.

## Features
- Adds / Updates `height`, `width`, `fill` attributes in the `svg` root element
- Copy files from one directory to another after processing them

## Usage
You can use the `copy-svg` function from this package by supplying the source and destination directories:
```lisp
(copy-svg "./quicklisp/local-projects/cl-djula-svg/static/svgs/" "./quicklisp/local-projects/cl-djula-svg/templates/svgs/")
```
## Installation
You can install `cl-djula-svg` via quicklisp:

```lisp
(ql:quickload :cl-djula-svg)
```

## Author

* Rajasegar Chandran

## Copyright

Copyright (c) 2022 Rajasegar Chandran
