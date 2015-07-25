elixir Cookbook
===============
This cookbook for install elixir.

Requirements
------------
Supported CentOS.

#### packages
- `git` - elixir needs git.
- `erlang` - elixir needs erlang.

Attributes
----------
#### elixir::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['elixir']['version']</tt></td>
    <td>String</td>
    <td>install version</td>
    <td><tt>1.0.5</tt></td>
  </tr>
  <tr>
    <td><tt>['elixir']['home']</tt></td>
    <td>String</td>
    <td>elixir home path</td>
    <td><tt>/usr/local/elixir</tt></td>
  </tr>
  <tr>
    <td><tt>['elixir']['link']</tt></td>
    <td>String</td>
    <td>symbolic link</td>
    <td><tt>/usr/local/elixir/bin</tt></td>
  </tr>
  <tr>
    <td><tt>['elixir']['repo']</tt></td>
    <td>String</td>
    <td>elixir github repository</td>
    <td><tt>https://github.com/elixir-lang/elixir.git</tt></td>
  </tr>
  <tr>
    <td><tt>['elixir']['source']</tt></td>
    <td>String</td>
    <td>install src path</td>
    <td><tt>/usr/local/elixir/src</tt></td>
  </tr>
</table>

Usage
-----
Just include `elixir` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[elixir]"
  ]
}
```


License and Authors
-------------------
Authors: [Slowhand0309](https://github.com/Slowhand0309)
