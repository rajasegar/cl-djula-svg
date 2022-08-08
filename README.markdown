# cl-djula-svg
![Build and Deploy](https://github.com/rajasegar/cl-djula-svg/workflows/CI/badge.svg)
[![Quicklisp](http://quickdocs.org/badge/cl-djula-svg.svg)](http://quickdocs.org/cl-djula-svg/)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE)


A Common Lisp package that will help process SVG files and copy them to folders
so that they can be used in [Djula](https://github.com/mmontone/djula) templates in a [Caveman](https://github.com/fukamachi/caveman) web application framework.

## Features
- Adds / Updates `height`, `width`, `fill`, `class` attributes in the `svg` root element
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
