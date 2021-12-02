directory "#{ENV['HOME']}/bin" do
  owner node[:user]
end

directory "#{ENV['HOME']}/var/data" do
  owner node[:user]
end

directory "#{ENV['HOME']}/.config" do
  owner node[:user]
end


include_cookbook 'functions'

