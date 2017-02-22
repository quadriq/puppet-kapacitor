class kapacitor::config(
    $config = {},
    $tick_directory = '/etc/kapacitor/tick'
  ){

  $default_config = {
      'http' => {
        'bind-address' => ':9092',
        'auth-enabled' => false,
        'log-enabled' => true,
        'write-tracing' => false,
        'pprof-enabled' => false,
        'https-enabled' => false,
        'https-certificate' => '/etc/ssl/kapacitor.pem'
      },
      'influxdb' => {
        'enabled' => true,
        'default' => true,
        'name' => 'localhost',
        'urls' => ['http://localhost:8086'],
        'username' => '',
        'password' => '',
        'timeout' => 0,
        'insecure-skip-verify' => false,
        'startup-timeout' => '5m',
        'disable-subscriptions' => false,
        'subscription-protocol' => 'http',
        'subscriptions-sync-interval' => '1m0s',
        'kapacitor-hostname' => '',
        'http-port' => 0,
        'udp-bind' => '',
        'udp-buffer' => 1000,
        'udp-read-buffer' => 0,
      }
  }

  $final_config = deep_merge($default_config, $config)

  file { $tick_directory:
    ensure => directory,
    mode   => '0644',
  }

  file {'/etc/kapacitor/kapacitor.conf':
    content => template('kapacitor/kapacitor.conf.erb'),
    notify  => Service['kapacitor']
  }
}
