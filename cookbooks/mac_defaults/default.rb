include_recipe 'mac_defaults'

# ------------
# キーボード関連
# ------------
# フルキーボードアクセスを有効
defaults %w(NSGlobalDomain AppleKeyboardUIMode) do
  value 3
end

# Fnキーをデフォルトで有効
defaults %w(NSGlobalDomain com.apple.keyboard.fnState) do
  type :bool
  value true
end

# キーのリピート速度 (1=15ms)
defaults %w(NSGlobalDomain KeyRepeat) do
  value 2
end

# リピート入力認識までまでの時間
defaults %w(NSGlobalDomain InitialKeyRepeat) do
  value 15
end

# キーリピートを可能に
# https://marketplace.visualstudio.com/items?itemName=vscodevim.vim
defaults %w(NSGlobalDomain ApplePressAndHoldEnabled) do
  action :delete
end

# ------------
# Trackpad 関連
# ------------
# タップでクリック
%w(
  com.apple.driver.AppleBluetoothMultitouch.trackpad
  com.apple.AppleMultitouchTrackpad
).each do |domain|
  defaults %W(#{domain} Clicking) do
    type :bool
    value true
  end
end

# 軌跡の速さ
defaults %w(NSGlobalDomain com.apple.trackpad.scaling) do
  value 3
end

# スクロールの方向
defaults %w(NSGlobalDomain com.apple.swipescrolldirection) do
  type :bool
  value false
end

# ページ間を3本指でスワイプ
defaults %w(NSGlobalDomain AppleEnableSwipeNavigateWithScrolls) do
  type :bool
  value false
end

# フルスクリーンアプリケーション間を4本指でスワイプ
defaults %w(com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture) do
  value 1
end

# ------------
# Finder 関連
# ------------
# ステータスバーを表示
defaults %w(com.apple.finder ShowStatusBar) do
  type :bool
  value true
end

# パスバーを表示
defaults %w(com.apple.finder ShowPathbar) do
  type :bool
  value true
end

# 壁紙をクリックしてデスクトップを表示する機能を無効
defaults %w(com.apple.WindowManager EnableStandardClickToShowDesktop) do
  type :bool
  value false
end

# ------------
# Dock 関連
# ------------
# 自動的に非表示
defaults %w(com.apple.dock autohide) do
  type :bool
  value true
end

# サイズを変更
defaults %w(com.apple.dock tilesize) do
  value 36
end

# 実行中のアプリのみ表示する
# defaults %w(com.apple.dock static-only) do
#   type :bool
#   value true
# end

# 最近使用したアプリを表示しない
defaults %w(com.apple.dock show-recents) do
  type :bool
  value false
end

# ------------
# Screen Capture 関連
# ------------
# Screen Capture に影を含めない
defaults %w(com.apple.screencapture disable-shadow) do
  type :bool
  value true
end

# Screen Capture のファイル名のプレフィックスを "SS" にする
defaults %w(com.apple.screencapture name) do
  type :string
  value "SS"
end

# スクリーンショットの保存先を ~/screenshots にする
directory "#{ENV['HOME']}/screenshots"

defaults %w(com.apple.screencapture location) do
  type :string
  value "#{ENV['HOME']}/screenshots"
end

# サムネイルを表示しない
defaults %w(com.apple.screencapture show-thumbnail) do
  type :bool
  value false
end
