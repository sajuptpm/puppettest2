class memcached(
  $package_ensure          = "present",
  $package_name            = "memcached",
  $local_settings_template = 'memcached/memcached.conf.erb',
  $config_file             = '/etc/memcached.conf'
) {


  package { $package_name:
    ensure  => $package_ensure,
  }



  file { $config_file:
    content => template($local_settings_template),
    mode    => '0644',
  }

  }
