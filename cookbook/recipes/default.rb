#
# Cookbook Name:: met-bora-ci
# Recipe:: default
#
# Copyright (C) 2014 MET Norway
#
# All rights reserved - Do Not Redistribute
#

package 'git'

include_recipe 'met-bora-ci::arcanist'

include_recipe 'go::agent'
