cookbook_file ".env" do
  path "/tmp/.env"
end

dotenv "/tmp" do
  action :load
end
