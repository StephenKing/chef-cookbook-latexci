#
# Cookbook Name:: latexci
# Recipe:: default
#
# Copyright (C) 2014 
#
# 
#

include_recipe "git"
include_recipe "ant"


%w{
  latex
  jenkins
}.each do |recipe|
  include_recipe "#{cookbook_name}::#{recipe}"
end