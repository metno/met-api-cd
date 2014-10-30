#
# Cookbook Name:: met-bora-ci
# Recipe:: jenkins_server
#
# Copyright (C) 2014 MET Norway
#

include_recipe 'jenkins::master'

include_recipe 'nginx'

template '/etc/nginx/sites-available/jenkins-server.conf' do
    source 'nginx/jenkins.conf.erb'
    owner 'root'
    group 'root'
    mode '0640'
end

link '/etc/nginx/sites-enabled/jenkins-server.conf' do
    to '/etc/nginx/sites-available/jenkins-server.conf'
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

include_recipe 'met-bora-ci::_common'

jenkins_plugin 'git' do
    notifies :reload, "service[jenkins]", :immediately
end

jenkins_plugin 'build-pipeline-plugin' do
    notifies :reload, "service[jenkins]", :immediately
end
