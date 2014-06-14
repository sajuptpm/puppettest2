# This script will query metadata
# and create "facts" out of them for use within Puppet.
require "json"
require 'facter'

# Get the instance-id and set it as a fact.
cmd = sprintf('/usr/bin/wget -q -O - http://169.254.169.254/openstack/latest/meta_data.json')
result = `#{cmd}`
result = JSON.parse(result)
instance_type = result["meta"]["vm_type"]
memcached_add = result["meta"]["memcached"]
Facter.add('instance_type') do
    setcode { instance_type }
end
Facter.add('memcached_add') do
    setcode { memcached_add }
end
