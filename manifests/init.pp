# == Class: kapacitor
class kapacitor(
    $version = '1.2.0',
    $config = {}
  ) {

  class{'kapacitor::install':
    version => $version,
  } ->

  class{'kapacitor::config':
    config => $config,
  }

  service { 'kapacitor':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package["kapacitor-${version}"],
  }

}
