#
# Cookbook Name:: met-bora-ci
# Recipe:: _sbt
#
# Copyright (C) 2014 MET Norway
#
# This recipe sets up the Simple Build Tool
#

package 'wget'
package 'openjdk-7-jdk'
package 'unzip'

filename = "sbt-#{node[:'met-bora-ci'][:sbt_version]}.deb"
dest = "/var/cache/apt/archives/#{filename}"

remote_file dest do
    action :create
    source "http://dl.bintray.com/sbt/debian/#{filename}"
    checksum "c89d26ae4ce9b2572ae8587cbf887b196727a33e8b6cec2672358fb4c724af70"
    owner "root"
    group "root"
    mode "0644"
    backup false
end

dpkg_package "sbt" do
    source dest
end

#
# Does not play well in Vagrant/Test Kitchen,
# but should probably be enabled to cache the dependencies.
#

#total_memory = node['memory']['total']
#mem = total_memory.split("kB")[0].to_i/1024
#
#execute "download dependencies for sbt" do
    #environment "JAVA_OPTS" => "-Xmx#{mem}M"
    #user node[:'met-bora-ci'][:ci_user]
    #command "sbt -batch"
#end
