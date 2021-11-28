directory "#{ENV['HOME']}/.config" do
  owner node[:user]
end

dotfile '.config/git'
dotfile '.tmux.conf'
dotfile '.vimrc'
