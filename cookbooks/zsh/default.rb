# Make symbolic link to .zshenv
link File.join(ENV['HOME'], '.zshenv') do
  to File.expand_path("../../../config/.zshenv", __FILE__)
end
