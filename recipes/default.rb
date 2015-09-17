#
# Cookbook Name:: rhapsody-windows
# Recipe:: default
#
# Copyright 2015, Lonnie VanZandt
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

# https://www15.software.ibm.com/sdfdl/v2/fulfill
# /CN5IJML/Xa.2/Xb.GUsb5m8rB11lxenD7rjhwY0W_pmojqGLlqi-8vvZank
# /Xc.CN5IJML/Rhapsody_eval_8.1.3_Windows_32.zip/Xd./Xf.LPR.D1VC
# /Xg.8266743/Xi.RATLe-RHAPDEV-EVAL/XY.regsrvs/XZ.Mv1Tmh4owj5-DKW-yV04Yihhxs8
# /Rhapsody_eval_8.1.3_Windows_32.zip

require 'uri'

# form the URL to the medium file
query = node['rhapsody-windows']['query'].map{ |k,v|
  [CGI.escape(k.to_s), "=", CGI.escape(v.to_s)]
}.map( &:join ).join( "&" )
  
filename_woext = "#{node['rhapsody-windows']['product']}_#{node['rhapsody-windows']['arch']}"
filename = "#{filename_woext}.#{node['rhapsody-windows']['compression']}"
  
download_uri = URI::Generic.build(
  :scheme => node['rhapsody-windows']['scheme'], 
  :host => node['rhapsody-windows']['host'],
  :path => "#{node['rhapsody-windows']['path_preamble']}/" \
    + "#{filename}" \
    + "#{node['rhapsody-windows']['path_suffix']}/" \
    + "#{filename}"   
    )

unzipPath = Pathname( node['rhapsody-windows']['unzip_to'] )

directory unzipPath.to_s do
  action :create
  recursive true
end

windows_zipfile unzipPath.to_s do
  action :unzip
  source download_uri.to_s
  
  not_if { unzipPath.join( filename_woext ).exist?() }
end

env "TELELOGIC_LICENSE_FILE" do
  action modify
  key_name "TELELOGIC_LICENSE_FILE"
  value node['rhapsody-windows']['license_variable']
end