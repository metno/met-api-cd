#
# Cookbook Name:: met-bora-ci
# Recipe:: _docker
#
# Copyright (C) 2014 MET Norway
#
# This recipe sets up docker on the CI nodes.
#

include_recipe 'docker'

svc = Helpers::Docker.docker_service(node)

group "docker" do
    members node[:'met-bora-ci'][:ci_user]
    notifies :restart, "service[#{svc}]"
    notifies :reload, "service[jenkins]", :immediately
end
