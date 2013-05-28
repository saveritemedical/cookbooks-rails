node[:deploy].each do |application, deploy|
  Chef::Log.info("Ensuring shared/assets directory for #{application} app...")
	 if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping deploy::rails application #{application} as it is not an Rails app")
    next
  end
 
  directory "#{deploy[:deploy_to]}/shared/assets" do
    group deploy[:group]
    owner deploy[:user]
    mode 0775
    action :create
    recursive true
  end
end
