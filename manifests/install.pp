class kapacitor::install(
    $version
  ){

  # from official docu:
  # https://portal.influxdata.com/downloads
  #
  # wget https://dl.influxdata.com/kapacitor/releases/kapacitor-1.2.0.x86_64.rpm
  # sudo yum localinstall kapacitor-1.2.0.x86_64.rpm
  package { "kapacitor-${version}":
    provider => 'rpm',
    ensure   => 'present',
    source   => "https://dl.influxdata.com/kapacitor/releases/kapacitor-${version}.x86_64.rpm"
  }
}
