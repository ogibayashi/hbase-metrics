# hbase-metrics

hbase-metrics is a wrapper to collect metrics from HBase. It utilizes hadoop-metrics2 (https://github.com/ryukobayashi/hadoop-metrics2) 

## Installation

### gem

```ruby
gem install hadoop-metrics2
```

## Usage

### HMaster

```
require 'hbase_metrics/hbase_master'

master = HBaseMetrics::HMaster.new("localhost", 16010, false)
puts JSON.pretty_generate(master.server)
puts JSON.pretty_generate(master.assignment_manger)
```

### RegionServer

```
require 'hbase_metrics/region_server'

rs = HBaseMetrics::RegionServer.new("localhost", 16030, false)
puts JSON.pretty_generate(rs.server)
puts JSON.pretty_generate(rs.regions)
```

## Copyright

<table>
  <tr>
    <td>Author</td><td>Hironori Ogibayashi</td>
  </tr>
  <tr>
    <td>Copyright</td><td>Copyright (c) 2015- Hironori Ogibayashi</td>
  </tr>
  <tr>
    <td>License</td><td>Apache2 License</td>
  </tr>
</table>
