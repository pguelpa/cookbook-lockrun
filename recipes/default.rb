#
# Cookbook Name:: lockrun
# Recipe:: default
#

require 'tmpdir'

package 'build-essential' do
  action :install
end

directory node[:lockrun][:prefix] do
  owner node[:lockrun][:owner]
  mode '0755'
  action :create
end

remote_file "#{Chef::Config[:file_cache_path]}/lockrun.c" do
  source "https://raw.github.com/pushcx/lockrun/master/lockrun.c"
  action :create_if_missing
end

bash 'compile_lockrun_source' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    gcc lockrun.c -o lockrun
    sudo cp lockrun #{node[:lockrun][:prefix]}
  EOH
end
