actions :load, :copy
default_action :load

attribute :name, :kind_of => String, :name_attribute => true
attribute :app_env, :kind_of => String, :default => "default"
attribute :user, :kind_of => String, :default => node['ruby']['deploy_user']
attribute :group, :kind_of => String, :default => node['ruby']['deploy_group']
