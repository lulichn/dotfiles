dotfile '.zsh'
dotfile '.zshenv'

# Prezto
git "#{ENV['HOME']}/.zsh/prezto" do
  repository "https://github.com/sorin-ionescu/prezto.git"
  recursive true
end

# Zsh configuration
%w[
  zlogin
  zlogout
].each do |cfg|
  link File.join(ENV['HOME'], ".zsh/", "." << cfg) do
    to File.join(ENV['HOME'], ".zsh/prezto/runcoms", cfg)
    user node[:user]
  end
end

