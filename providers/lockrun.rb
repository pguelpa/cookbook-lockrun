action :create do
  execute 'lockrun command' do
    command "lockrun --lockfile #{new_resource.lockfile} -- #{new_resource.command}"
  end
end
