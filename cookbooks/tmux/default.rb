
# Install tpm (Tmux Plugin Manager)
git "#{ENV['HOME']}/.tmux/plugins/tpm" do
  repository "https://github.com/tmux-plugins/tpm.git"
  recursive true
end

