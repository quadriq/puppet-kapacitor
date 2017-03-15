# Puppet Module `kapacitor`

puppet integration of [influxdb - kapacitor](https://docs.influxdata.com/kapacitor/v1.2/introduction/getting_started/)

currently under development.. any contribution - welcomed!

supported OS:
 * CentOs

## Usage:

```
include kapacitor
```

or with hiera:

```
classes:
 - kapacitor
```


advanced usage with hiera (overriding parameters, defined in `config.pp`):


```yaml
classes:
 - kapacitor

kapacitor::config:
  http:
    bind-address: 9093

  influxdb:
    name: 'myhost.abc.de'
```
