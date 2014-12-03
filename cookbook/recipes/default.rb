#
# Cookbook Name:: met-api-cd
# Recipe:: default
#
# Copyright (C) 2014 MET Norway
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

include_recipe 'java'

include_recipe 'met-api-cd::sbt'

package 'git'
package 'curl'

Chef::Log.info(node['recipes'].inspect)
