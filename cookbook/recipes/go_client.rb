#
# Cookbook Name:: met-bora-ci
# Recipe:: go_client
#
# Copyright (C) 2014 MET Norway
#
# This recipe sets up a Go agent.
#

include_recipe 'met-bora-ci::_common'

include_recipe 'go::agent'
