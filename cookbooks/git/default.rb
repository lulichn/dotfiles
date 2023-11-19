# シンボリックリンクの作成
# $XDG_CONFIG_HOME/config/git を参照しないアプリケーションが存在するため、
# $HOME/.config/git にシンボリックリンクを作成する
directory File.join(ENV['HOME'], '.config') do; end

link File.join(ENV['HOME'], '.config', 'git') do
  to File.expand_path("../../../config/git", __FILE__)
end
