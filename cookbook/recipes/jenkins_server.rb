#
# Cookbook Name:: met-bora-ci
# Recipe:: jenkins_server
#
# Copyright (C) 2014 MET Norway
#

include_recipe 'jenkins::master'

include_recipe 'met-bora-ci::_common'

jenkins_plugin 'git'
jenkins_plugin 'build-pipeline-plugin'
