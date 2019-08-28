define :make_alias, source: nil do
  source = params[:source] || params[:name]
  link File.join("#{ENV['HOME']}/bin", params[:name]) do
    to File.expand_path("../files/#{source}", __FILE__)
    user node[:user]
  end
end

dotfile '.config/git'
make_alias 'git-d'
