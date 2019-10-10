jabba_home="#{ENV['HOME']}/.jabba"

directory "#{jabba_home}/bin/" do
  owner node[:user]
end

result = run_command('curl -sL https://shyiko.github.com/jabba/latest', error: false)
unless result.success?
  raise HTTPUnknownError
end
latest_version = result.stdout.chomp

jabba_url="https://github.com/shyiko/jabba/releases/download/#{latest_version}/jabba-#{latest_version}-darwin-amd64"

result = run_command("#{jabba_home}/bin/jabba --version", error: false)
current_version = ''
if result.success?
  current_version = result.stdout.chomp
end

http_request 'fetch jabba' do
  path "#{jabba_home}/bin/jabba"
  url "#{jabba_url}"
  owner node[:user]
  mode '111'
  not_if "[ '#{latest_version}' = '#{current_version}' ]"
end

template "#{jabba_home}/jabba.sh" do
  action :create
  source "files/jabba.sh"
  variables(jabba_home: jabba_home)
end