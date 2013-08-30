cookbooks-anyenv Cookbook
=========================
This cookbook install anyenv and \*env and specified language and versions


Attributes
----------

user.name: user name
user.home: home directory

anyenv.(perl|ruby|node|python|php)
  .versions: install versions
  .global: set to global version


Usage
-----
#### cookbooks-anyenv::default

```json
{
  "user": {
    "name": "vagrant",
    "home": "/home/vagrant"
  },
  "anyenv": {
    "perl": {
      "versions":   ["5.18.1"],
      "global":     "5.18.1"
    },
    "ruby": {
      "versions":   ["2.0.0-p247"],
      "global":     "2.0.0-p247"
    },
    "node": {
      "versions":  ["v0.10.17"],
      "global":    "v0.10.17"
    },
    "python": {
      "versions":   ["2.7.5"],
      "global":     "2.7.5"
    },
  }
}
```

Contributing
------------

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: koba04

The MIT License

Copyright (c) 2013 koba04

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
