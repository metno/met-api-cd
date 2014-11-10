#
# Cookbook Name:: met-api-cd
# Recipe:: jenkins
#
# Copyright (C) 2014 MET Norway
#

include_recipe 'met-api-cd::_common'

jenkins_plugin 'git'
jenkins_plugin 'build-pipeline-plugin'
jenkins_plugin 'sbt'
