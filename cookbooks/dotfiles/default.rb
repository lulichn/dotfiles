directory "#{ENV['HOME']}/.config" do
  owner node[:user]
end

dotfile '.tmux.conf'
dotfile '.vimrc'
