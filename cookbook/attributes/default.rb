default[:nginx][:default_site_enabled] = false

default[:'met-api-cd'][:agent_search_query] =
  "chef_environment:#{node.chef_environment} AND recipes:met-api-cd\\:\\:default"

default[:'met-api-cd'][:phabricator][:url] = 'https://phabricator.example.com'
default[:'met-api-cd'][:phabricator][:user] = 'fixme'
default[:'met-api-cd'][:phabricator][:certificate] = 'fixme'

default[:'met-api-cd'][:ci_user] = 'jenkins'

default[:'met-api-cd'][:sbt_version] = '0.13.5'
