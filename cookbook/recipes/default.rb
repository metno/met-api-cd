#
# Cookbook Name:: met-api-cd
# Recipe:: default
#
# Copyright (C) 2014 MET Norway
#
# All rights reserved - Do Not Redistribute
#

package 'git'

include_recipe 'met-api-cd::arcanist'

include_recipe 'go::agent'
