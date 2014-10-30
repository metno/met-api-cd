default[:nginx][:default_site_enabled] = false

default[:'met-bora-ci'][:domain] = node[:fqdn]
default[:'met-bora-ci'][:nginx][:ssl] = false
default[:'met-bora-ci'][:nginx][:ssl_cert_path] = '/dev/null'
default[:'met-bora-ci'][:nginx][:ssl_key_path] = '/dev/null'

default[:'met-bora-ci'][:agent_search_query] =
  "chef_environment:#{node.chef_environment} AND recipes:met-bora-ci\\:\\:default"

default[:'met-bora-ci'][:phabricator][:url] = 'https://phabricator.example.com'
default[:'met-bora-ci'][:phabricator][:user] = 'fixme'
default[:'met-bora-ci'][:phabricator][:certificate] = 'fixme'

default[:'met-bora-ci'][:ci_user] = 'jenkins'

default[:'met-bora-ci'][:sbt_version] = '0.13.5'
