if "$::instance_type" == "horizon" {
class { '::horizon':
    fqdn                => "beta1.jiocloud.com",
    secret_key          => "1212nn2jjds",
    keystone_url        => "https://identity-beta.jiocloud.com:443/v2.0",
    package_ensure      => "latest",
    cache_server_ip     => $::memcached_add

  }
}
if "$::instance_type" == "memcached" {
class { '::memcached':
    package_ensure      => "present"

      }
}

