#
# Cookbook Name:: met-bora-ci
# Recipe:: server
#
# Copyright (C) 2014 MET Norway
#
# All rights reserved - Do Not Redistribute
#

package 'git'

include_recipe 'met-bora-ci::arcanist'

include_recipe 'go::default'

include_recipe 'nginx'

template '/etc/nginx/sites-available/go-server.conf' do
    source 'nginx/site.conf.erb'
    owner 'root'
    group 'root'
    mode '0640'
end

link '/etc/nginx/sites-enabled/go-server.conf' do
    to '/etc/nginx/sites-available/go-server.conf'
end

firewall_rule "http" do
    port 80
    source '0.0.0.0/0'
    protocol :tcp
    action :allow
end

if node[:'met-bora-ci'][:nginx][:ssl]
    firewall_rule "https" do
        port 443
        source '0.0.0.0/0'
        protocol :tcp
        action :allow
    end
end

Chef::Log.info("Searching for Go agent nodes. Query: #{node[:'met-bora-ci'][:agent_search_query]}")
agents = search(:node, node[:'met-bora-ci'][:agent_search_query])

agents.each_with_index do |agent, i|

    firewall_rule "agent_#{i}_8153" do
        port 8153
        source agent[:ipaddress]
        protocol :tcp
        action :allow
    end

    firewall_rule "agent_#{i}_8154" do
        port 8154
        source agent[:ipaddress]
        protocol :tcp
        action :allow
    end

end
