#
# Cookbook Name:: cook_rails
# Attributes:: vagrant
#
# Copyright 2014-2014, Mercicc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# unicorn config settings for vagrant
default['unicorn-ng'][:config][:config_file_path] = "#{node[:server][:app_path]}/tmp/config"
default['unicorn-ng'][:config][:config_file] = "#{node['unicorn-ng'][:config][:config_file_path]}/unicorn.rb"
default['unicorn-ng'][:config][:working_directory] = node[:server][:app_path]
default['unicorn-ng'][:config][:worker_processes] = 2
default['unicorn-ng'][:config][:listen] = "/tmp/unicorn.#{node[:server][:app_name]}.sock"
default['unicorn-ng'][:config][:owner] = node[:server][:user]
default['unicorn-ng'][:config][:group] = node[:server][:group]

default['unicorn-ng'][:service][:name] = "unicorn_#{node[:server][:app_name]}"
default['unicorn-ng'][:service][:rails_root] = node[:server][:app_path]
default['unicorn-ng'][:service][:config] = node['unicorn-ng'][:config][:config_file]
default['unicorn-ng'][:service][:environment] = 'production'
default['unicorn-ng'][:service][:bundle] = "/home/#{node[:server][:user]}/.rbenv/shims/bundle"
default['unicorn-ng'][:service][:user] = node[:server][:user]
default['unicorn-ng'][:service][:owner] = node[:server][:user]
default['unicorn-ng'][:service][:group] = node[:server][:group]

# nginx config settings for vagrant
default[:cook_rails][:nginx][:config_name] = node[:server][:app_name]
default[:cook_rails][:nginx][:server_name] = node[:server][:name]
default[:cook_rails][:nginx][:root] = node[:server][:app_path]
default[:cook_rails][:nginx][:access_log_file] = "#{node[:server][:app_path]}/log/nginx.access.log"
default[:cook_rails][:nginx][:error_log_file] = "#{node[:server][:app_path]}/log/nginx.error.log"

# postgresql settings for vagrant
default[:cook_rails][:postgresql][:environment] = node['unicorn-ng'][:service][:environment]
default[:cook_rails][:postgresql][:encoding] = 'unicode'
default[:cook_rails][:postgresql][:database] = "#{node[:server][:app_name]}_#{node['unicorn-ng'][:service][:environment]}"
default[:cook_rails][:postgresql][:pool] = 5
default[:cook_rails][:postgresql][:username] = node[:server][:user]
default[:cook_rails][:postgresql][:password] = node[:server][:user]
default[:cook_rails][:postgresql][:host] = 'localhost'
