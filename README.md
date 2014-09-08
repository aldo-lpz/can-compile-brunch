can-compile-brunch
==================

Simple Brunch plugin to add support for mustache pre-compiled templates using [can-compile](https://github.com/daffl/can-compile) for CanJS views.

## Usage

Install the plugin via npm with `npm install --save can-compile-brunch`.

Or, do manual install:

* Add `"can-compile-brunch": "x.y.z"` to `package.json` of your brunch app.
* If you want to use git version of plugin, add
`"can-compile-brunch": "git+ssh://git@github.com:aldoivan/can-compile-brunch.git"`.

_Optional_ Specify the CanJS version to compile your views:

```coffeescript
exports.config =
  # ...
  plugins:
    canCompile:
      version: '2.1.3'
```

## License

The MIT License (MIT)

Copyright (c) 2014 Aldo Lopez

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
