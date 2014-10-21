def whyrun_supported?
  true
end

use_inline_resources

def load_current_resource
  @current_resource = Chef::Resource::Dotenv.new(new_resource.name)
end

action :load do
  chef_gem "dotenv" do
    action :install
  end

  # load ENV variables from .env
  require 'dotenv'
  ::Dotenv.load "#{new_resource.name}/.env"
end
