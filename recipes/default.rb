# install dotenv gem for the Ruby running Chef
chef_gem "dotenv" do
  action :install
end

# load ENV variables from .env
require 'dotenv'
Dotenv.load
