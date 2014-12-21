#
# Cookbook Name:: cook_rails
# Recipe:: basic
#
# Copyright 2014, Mercicc
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt::default"
include_recipe "git::default"
include_recipe "nodejs::default"
include_recipe "nginx::default"
include_recipe "postgresql::server"
include_recipe "postgresql::ruby"
include_recipe "sqlite::default"
