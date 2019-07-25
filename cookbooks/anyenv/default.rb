git "#{ENV['HOME']}/.anyenv" do
  repository 'https://github.com/anyenv/anyenv'
  if ENV['SUDO_USER']
    user ENV['SUDO_USER']
  end
end
