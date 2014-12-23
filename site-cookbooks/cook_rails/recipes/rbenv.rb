#
# Cookbook Name:: cook_rails
# Recipe:: rbenv
#
# Copyright 2014, Mercicc
#
# All rights reserved - Do Not Redistribute
#

node.set[:rbenv][:user] = node[:server][:user]
node.set[:rbenv][:group] = node[:server][:group]
node.set[:rbenv][:install_prefix] = "/home/#{node[:rbenv][:user]}"
node.set[:rbenv][:root_path] = "#{node[:rbenv][:install_prefix]}/.rbenv"
node.set[:rbenv][:user_home] = "/home/#{node[:rbenv][:user]}"

include_recipe "rbenv"
include_recipe "rbenv::ruby_build"

# install Ruby
rbenv_ruby node[:ruby][:version] do
  global true
end

# install gem bundler
rbenv_gem "bundler" do
  ruby_version node[:ruby][:version]
end

# update rubygems
rbenv_gem "rubygems-update" do
  ruby_version node[:ruby][:version]
end
bash "update rubygems" do
  code "#{rbenv_shims_path}/update_rubygems"
end

# add .gemrc
file "#{node[:rbenv][:user_home]}/.gemrc" do
  content %(gem: "--no-ri --no-rdoc")
  owner node[:rbenv][:user]
  group node[:rbenv][:group]
  mode '0755'
  action :create
end
