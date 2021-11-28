dotfile '.zshenv'

# Prezto
git "#{ENV['HOME']}/dotfiles/config/zsh/prezto" do
  repository "https://github.com/sorin-ionescu/prezto.git"
  recursive true
end

# Zsh configuration
%w[
  zlogin
  zlogout
].each do |cfg|
  link File.join(ENV['HOME'], "dotfiles/config/zsh/", "." << cfg) do
    to File.join(ENV['HOME'], "dotfiles/config/zsh/prezto/runcoms", cfg)
    user node[:user]
  end
end

