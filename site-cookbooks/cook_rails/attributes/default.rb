#
# Cookbook Name:: cook_rails
# Attributes:: default
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

default[:ruby][:version] = "2.1.5"
default[:nginx][:default_site_enabled] = false
default[:postgresql][:password][:postgres] = "postgres"

# server config settings for vagrant
default[:server][:user] = 'vagrant'
default[:server][:group] = 'vagrant'
default[:server][:app_name] = 'vagrant'
default[:server][:app_path] = '/vagrant'
