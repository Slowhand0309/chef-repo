ant Cookbook
============
This cookbook for install ant.

Attributes
----------

#### ant::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ant']['version']</tt></td>
    <td>String</td>
    <td>install ant version</td>
    <td><tt>1.8.2</tt></td>
  </tr>
  <tr>
    <td><tt>['ant']['home']</tt></td>
    <td>String</td>
    <td>ant home path</td>
    <td><tt>/usr/local/ant</tt></td>
  </tr>
  <tr>
    <td><tt>['ant']['url']</tt></td>
    <td>String</td>
    <td>ant binaries url</td>
    <td><tt>[here](http://archive.apache.org/dist/ant/binaries/) + apache-ant-#{node['ant']['version']}-bin.tar.gz</tt></td>
  </tr>
  <tr>
    <td><tt>['ant']['checksum']</tt></td>
    <td>String</td>
    <td>binaries checksum</td>
    <td><tt>check [here](http://archive.apache.org/dist/ant/binaries/)</tt></td>
  </tr>
</table>

Usage
-----
#### ant::default

Just include `ant` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ant]"
  ]
}
```

License and Authors
-------------------
Authors: [Slowhand0309](https://github.com/Slowhand0309)
