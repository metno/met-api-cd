#
# Cookbook Name:: met-api-cd
# Recipe:: _docker
#
# Copyright (C) 2014 MET Norway
#
# This recipe sets up docker on the CI nodes.
#

include_recipe 'docker'

svc = Helpers::Docker.docker_service(node)

group "docker" do
    members node[:'met-api-cd'][:ci_user]
    notifies :restart, "service[#{svc}]"
end
