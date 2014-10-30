#
# Cookbook Name:: met-bora-ci
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
        "default" => node[:'met-bora-ci'][:phabricator][:url]
    },
    "hosts" => {
        "#{node[:'met-bora-ci'][:phabricator][:url]}/api/" => {
            "user" => node[:'met-bora-ci'][:phabricator][:user],
            "cert" => node[:'met-bora-ci'][:phabricator][:certificate]
        }
    }
}

file '/var/go/.arcrc' do
    owner 'go'
    group 'go'
    mode '0600'
    content JSON.pretty_generate(arcrc_hash)
end
