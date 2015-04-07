#
# Cookbook Name:: met-api-cd
# Recipe:: activator
#
# Copyright (C) 2015 MET Norway
#
# This recipe installs Scala Play (activator)
#

filename = "typesafe-activator-#{node['met-api-cd']['activator_version']}-minimal.zip"
dest = "#{Chef::Config[:file_cache_path]}/#{filename}"

remote_file dest do
    source "https://downloads.typesafe.com/typesafe-activator/#{node['met-api-cd']['activator_version']}/#{filename}"
    checksum "#{node['met-api-cd']['activator_sha256']}" # SHA256 CHECKSUM
    notifies :run, "execute[install-activator]", :immediately
    not_if do
        File.directory?("/opt/activator-#{node['met-api-cd']['activator_version']}-minimal")
    end
end

execute "install-activator" do
    command "unzip #{dest} -d /opt/"
    not_if do
        File.directory?("/opt/activator-#{node['met-api-cd']['activator_version']}-minimal")
    end
end

file "/opt/activator-#{node['met-api-cd']['activator_version']}-minimal/activator" do
  owner 'root'
  group 'root'
  mode '0755'
end

link "/usr/local/bin/activator" do
    to "/opt/activator-#{node['met-api-cd']['activator_version']}-minimal/activator"
end 
