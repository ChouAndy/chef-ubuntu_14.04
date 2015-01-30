#
# Cookbook Name:: cook_rails
# Recipe:: rbenv_setup
#
# Copyright 2014, Mercicc
#
# All rights reserved - Do Not Redistribute
#

case node[:platform]
when "ubuntu", "debian"
  include_recipe "apt"
end

include_recipe "build-essential"
include_recipe "git"
package "curl"

case node[:platform]
when "redhat", "centos", "amazon", "oracle"
  # TODO: add as per "rvm requirements"
  package "openssl-devel"
  package "zlib-devel"
  package "readline-devel"
  package "libxml2-devel"
  package "libxslt-devel"
when "ubuntu", "debian"
  package "libc6-dev"
  package "automake"
  package "libtool"

  # https://github.com/sstephenson/ruby-build/issues/119
  # "It seems your ruby installation is missing psych (for YAML
  # output). To eliminate this warning, please install libyaml and
  # reinstall your ruby."
  package 'libyaml-dev'

  # needed to unpack rubygems
  package 'zlib1g'
  package 'zlib1g-dev'

  # openssl support for ruby
  package "openssl"
  package 'libssl-dev'

  # readline for irb and rails console
  package "libreadline-dev"

  # for ruby stdlib rexml and nokogiri
  # http://nokogiri.org/tutorials/installing_nokogiri.html
  package "libxml2-dev"
  package "libxslt1-dev"

  # better irb support
  package "ncurses-dev"

  # for searching packages
  package "pkg-config"

  # for ruby 2.2.0
  package "libffi-dev"

  # for convert upload image
  package "imagemagick"
end
