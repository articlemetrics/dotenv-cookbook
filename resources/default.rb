actions :load
default_action :load

attribute :name, :kind_of => String, :name_attribute => true
attribute :dotenv, :kind_of => String, :default => "default"
attribute :user, :kind_of => String, :default => node['ruby']['deploy_user']
attribute :group, :kind_of => String, :default => node['ruby']['deploy_group']
