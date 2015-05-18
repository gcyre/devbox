##
# Cookbook Name:: devbox
# Recipe:: activate_windows
#
# Copyright 2015
# Written by: gcyre
# Description: Installs Powershell V4

h_key = 'HKLM:\\SOFTWARE\\Microsoft\\PowerShell\\3\\PowerShellEngine'

reboot "now" do
  action :nothing
  reason "Cannot continue Chef run without a reboot."
  delay_mins 2
end

if node['platform'] == 'windows'
	windows_package 'WFMC 4.0 install'do
	  guard_interpreter :powershell_script
	  source node['powershell']['url']
	  checksum node['powershell']['checksum']
	  installer_type :custom
	  options '/quiet /norestart'
	  action :install
	  success_codes [0, 42, 127, 3010]
	  notifies :reboot_now, 'reboot[now]', :immediately
	  not_if ("if(Get-ItemProperty #{h_key} |select -expandproperty 'PowerShellVersion'| where {$_.contains('4.0')}){return $true}else{return $false}")	
	end
end