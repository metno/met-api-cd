default['met-api-cd']['phabricator']['url'] = 'https://phabricator.example.com'
default['met-api-cd']['phabricator']['user'] = 'fixme'
default['met-api-cd']['phabricator']['certificate'] = 'fixme'

default['met-api-cd']['ci_user'] = 'jenkins'

default['met-api-cd']['sbt_version'] = '0.13.5'
default['met-api-cd']['activator_version'] = '1.3.2'
default['met-api-cd']['activator_sha256'] = "5c18f70e232eb06947c34fa67ba9c34302c9156b0a15e3a2084f279f47f4ba0c"


default['java']['install_flavor'] = 'openjdk'
default['java']['jdk_version'] = '7'

#Go CD config
default['go']['agent']['server_host'] = node['fqdn']
default['go']['version'] = '14.4.0-1356'
