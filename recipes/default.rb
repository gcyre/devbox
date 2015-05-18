#
# Cookbook Name:: create
# Recipe:: default
#
# Copyright (C) 2015 Garry Cyre
#
# All rights reserved - Do Not Redistribute
#
 
 include_recipe "chocolatey::default"
 include_recipe 'devbox::powershell4_install'
 
 