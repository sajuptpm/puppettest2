# This script will query metadata
# and create "facts" out of them for use within Puppet.
 
require 'facter'
 
# Get the instance-id and set it as a fact.
cmd = sprintf('/usr/bin/wget -q -O - http://169.254.169.254/latest/meta-data/vm_type')
result = `#{cmd}`
Facter.add('instance_type') do
    setcode { result }
end
cmd = sprintf('/usr/bin/wget -q -O - http://169.254.169.254/latest/meta-data/memcached')
result = `#{cmd}`
Facter.add('memcached_add') do
    setcode { result }
end
