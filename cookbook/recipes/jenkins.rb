#
# Cookbook Name:: met-api-cd
# Recipe:: jenkins
#
# Copyright (C) 2014 MET Norway
#

jenkins_plugin 'git'
jenkins_plugin 'promoted-builds'
jenkins_plugin 'copyartifact'
jenkins_plugin 'sbt'
