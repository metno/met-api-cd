#
# Cookbook Name:: met-bora-ci
# Recipe:: _common
#
# Copyright (C) 2014 MET Norway
#
# This recipe sets up common stuff that needs to be present on all CI servers.
#

include_recipe 'apt'

package 'git'
package 'curl'

include_recipe 'met-bora-ci::arcanist'
