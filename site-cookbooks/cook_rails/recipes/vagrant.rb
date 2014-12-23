#
# Cookbook Name:: cook_rails
# Recipe:: vagrant
#
# Copyright 2014, Mercicc
#
# All rights reserved - Do Not Redistribute
#

# bundle install in app_path folder on Vagrant virtual machine
bash "bundle install" do
  cwd node[:server][:app_path]
  code "#{rbenv_shims_path}/bundle install"
end

# backup origin database.yml
bash "backup database.yml" do
  cwd node[:server][:app_path]
  code "mv -f config/database.yml config/database.yml.backup"
end

# create database.yml
template "#{node[:server][:app_path]}/config/database.yml" do
  source 'postgresql.yml.erb'
  owner node[:server][:user]
  group node[:server][:group]
  mode '0644'
end

# create postgresql user and database
postgresql_connection_info = {
    host: 'localhost',
    port: node[:postgresql][:config][:port],
    username: 'postgres',
    password: node[:postgresql][:password][:postgres]
}

postgresql_database_user node[:cook_rails][:postgresql][:username] do
  connection postgresql_connection_info
  password node[:cook_rails][:postgresql][:password]
  action :create
end

postgresql_database node[:cook_rails][:postgresql][:database] do
  connection postgresql_connection_info
  owner node[:cook_rails][:postgresql][:username]
  action :create
end

# database migration
bash "rake db:migrate" do
  cwd "/vagrant"
  code "RAILS_ENV=production #{rbenv_shims_path}/rake db:migrate"
end

# assets precompile
bash "rake assets:precompile" do
  cwd "/vagrant"
  code "RAILS_ENV=production #{rbenv_shims_path}/rake assets:precompile"
end

# setup unicorn
directory node['unicorn-ng'][:config][:config_file_path] do
  owner node['unicorn-ng'][:config][:owner]
  group node['unicorn-ng'][:config][:group]
  mode "2775"
  action [:create]
end

include_recipe "unicorn-ng::default"

service node['unicorn-ng'][:service][:name] do
  action :restart
end

# setup nginx
template node['nginx']['dir'] + '/sites-available/' + node[:cook_rails][:nginx][:config_name] do
  source 'nginx.conf.erb'
  owner node[:server][:user]
  group node[:server][:group]
  mode 0644
  notifies :reload, 'service[nginx]'
end

nginx_site node[:cook_rails][:nginx][:config_name] do
  enable true
end

# store database.yml
bash "store origin database.yml" do
  cwd "/vagrant"
  code "mv -f config/database.yml.backup config/database.yml"
end
