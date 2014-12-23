#
# Cookbook Name:: cook_rails
# Recipe:: setup
#
# Copyright 2014, Mercicc
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "curl"
include_recipe "git"
include_recipe "nodejs"
include_recipe "nginx"
include_recipe "postgresql::server"
include_recipe "postgresql::ruby"
include_recipe "sqlite"
