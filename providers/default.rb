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

  # load ENV variables from file specified by dotenv atrribute
  # use .env when dotenv is "default"
  require 'dotenv'
  filename = new_resource.dotenv == "default" ? ".env" : ".env.#{new_resource.dotenv}"
  ::Dotenv.load! "/var/www/#{new_resource.name}/current/#{filename}"
end

action :copy do
  # create shared folder if it doesn't exist
  directory "/var/www/#{new_resource.name}/shared" do
    owner new_resource.user
    group new_resource.group
    mode '0755'
  end

  # copy .env from current to shared
  remote_file "/var/www/#{new_resource.name}/shared/.env" do
    source "file:///var/www/#{new_resource.name}/current/.env"
    owner new_resource.user
    group new_resource.group
    mode '0644'
  end
end
