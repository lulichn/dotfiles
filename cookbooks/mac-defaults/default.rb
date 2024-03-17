include_recipe 'mac_defaults'

#
# Keyboard
#
## フルキーボードアクセスを有効
defaults '-g AppleKeyboardUIMode' do
  value 3
end

## キーリピート 1=15ms
defaults '-g KeyRepeat' do
  value 2
end

## リピート入力認識までの時間 1=15ms
defaults '-g InitialKeyRepeat' do
  value 15
end

## Move focus to the next window in application - Option + Tab
# plist 'Disable Spotlight hotkey' do
#   file '~/Library/Preferences/com.apple.symbolichotkeys.plist'
#   key ':AppleSymbolicHotKeys:27:value:parameters'
#   value {65535, 48, 524288}
# end

## ショートカット Spotlight を無効
## https://apple.stackexchange.com/questions/91679/is-there-a-way-to-set-an-application-shortcut-in-the-keyboard-preference-pane-vi
plist 'Disable Spotlight hotkey' do
  file '~/Library/Preferences/com.apple.symbolichotkeys.plist'
  key ':AppleSymbolicHotKeys:64:enabled'
  value false
end

plist 'Disable Spotlight hotkey' do
  file '~/Library/Preferences/com.apple.symbolichotkeys.plist'
  key ':AppleSymbolicHotKeys:65:enabled'
  value false
end

defaults 'kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled' do
  value false
end

#
# Trackpad
#
## Enable `Tap to click`
[
  'com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking',
  'com.apple.AppleMultitouchTrackpad Clicking'
].each do |key|
  defaults key do
    value true
  end
end

# タップでクリック
defaults '-g com.apple.mouse.tapBehavior' do
  host :currentHost
  value 1
end

defaults '-g com.apple.mouse.tapBehavior' do
  value 1
end

# ページ間をスワイプ [無効]
defaults '-g AppleEnableSwipeNavigateWithScrolls' do
  value false
end

defaults 'com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture' do
  value 1
end

# 軌跡の速さ
defaults '-g com.apple.trackpad.scaling' do
  value 2.5
end

# スクロール方向: ナチュラル [無効]
defaults '-g com.apple.swipescrolldirection' do
  value false
end

#
# Finder
#
## Display the file extensions
defaults 'NSGlobalDomain AppleShowAllExtensions' do
  value true
end

defaults 'com.apple.finder AppleShowAllFiles' do
  value false
end

defaults 'com.apple.finder ShowTabView' do
  value true
end

defaults 'com.apple.finder ShowStatusBar' do
  value true
end

defaults 'com.apple.finder ShowPathbar' do
  value true
end

plist 'Desktop Grid spacing' do
  file '~/Library/Preferences/com.apple.finder.plist'
  key ':DesktopViewSettings:IconViewSettings:gridSpacing'
  value '42'
end

plist 'Desktop Icon size' do
  file '~/Library/Preferences/com.apple.finder.plist'
  key ':DesktopViewSettings:IconViewSettings:iconSize'
  value '44'
end

## Avoid creating .DS_Store files on network volumes
defaults 'com.apple.desktopservices DSDontWriteNetworkStores' do
  value true
end

# Dock
## Automatically hide or show the Dock
defaults 'com.apple.dock autohide' do
  value true
end

# Menubar
defaults 'com.apple.menuextra.battery ShowPercent' do
  value 'YES'
end

# Desktop
## bottom right corner
defaults 'com.apple.dock wvous-br-corner' do
  value 10
end

defaults 'com.apple.dock wvous-br-modifier' do
  value 0
end

# Screen Capture
defaults 'com.apple.screencapture disable-shadow' do
  value true
end

defaults 'com.apple.screencapture name' do
  value "SS"
end

defaults 'com.apple.screencapture show-thumbnail' do
  value false
end

#
# Siri 無効化
#
defaults 'com.apple.Siri StatusMenuVisible' do
  value false
end

defaults 'com.apple.Siri UserHasDeclinedEnable' do
  value true
end

defaults 'com.apple.assistant.support \'Assistant Enabled\'' do
  value false
end

