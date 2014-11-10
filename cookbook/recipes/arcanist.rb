#
# Cookbook Name:: met-api-cd
# Recipe:: arcanist
#
# Copyright (C) 2014 MET Norway
#
# All rights reserved - Do Not Redistribute
#

require 'json'

include_recipe 'phabricator::arcanist'

arcrc_hash = {
    "config" => {
        "default" => node[:'met-api-cd'][:phabricator][:url]
    },
    "hosts" => {
        "#{node[:'met-api-cd'][:phabricator][:url]}/api/" => {
            "user" => node[:'met-api-cd'][:phabricator][:user],
            "cert" => node[:'met-api-cd'][:phabricator][:certificate]
        }
    }
}

file "/etc/arcrc" do
    owner node[:'met-api-cd'][:ci_user]
    group node[:'met-api-cd'][:ci_user]
    mode '0600'
    content JSON.pretty_generate(arcrc_hash)
end
