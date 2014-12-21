cook_rails Cookbook
======================
Install rails environment on Ubuntu 14.04 LTS

Requirements
------------

- Ubuntu 14.04 LTS

#### packages

- apt
- git
- nodejs
- nginx
- postgresql
- sqlite
- rbenv

Usage
-----

Just include `cook_rails` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[cook_rails]"
  ]
}
```

Authors and Contributors
------------------------

- ChouAndy ( <a href="https://github.com/ChouAndy" target="_blank">GitHub</a> )
