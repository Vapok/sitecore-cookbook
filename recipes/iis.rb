#
# Cookbook Name:: sitecore
# Recipe:: iis
#
# Copyright 2014 Huge, Inc.
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

#Prep Server for Windows and IIS Services utilizing existing cookbooks that handle this.
include_recipe 'windows'
include_recipe 'iis'
include_recipe 'iis::mod_application_initialization'
include_recipe 'iis::aspnet'
include_recipe 'iis::mod_aspnet45'
include_recipe 'iis::mod_auth_anonymous'
include_recipe 'iis::mod_iis6_metabase_compat'
include_recipe 'iis::mod_isapi'
include_recipe 'iis::mod_logging'
include_recipe 'iis::mod_management'
include_recipe 'iis::mod_security'
include_recipe 'iis::mod_tracking'


#Install additional features not covered in IIS Cookbook Recipes
features = %w(IIS-HttpRedirect IIS-LoggingLibraries IIS-RequestMonitor IIS-ApplicationDevelopment)

features.each do |feature|
  windows_feature feature do
    action :install
  end
end

#Remove Default Site
include_recipe 'remove_default_site'