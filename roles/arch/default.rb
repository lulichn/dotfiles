include_role 'base'
include_cookbook 'yay'

# Package
[
  # Fonts
  'otf-ipafont',
  'adobe-source-han-sans-jp-fonts',
  # 日本語入力
  'fcitx-configtool',
  'fcitx-im',
  # Shell
  'fasd',
  # Development
  'base-devel',
  # Virtualization
  'qemu',
  'libvirt',
  'virt-manager',
  # Docker
  'docker',
].each do |name|
  package name
end

# Aur
[
  # Fonts
  'fcitx-mozc-neologd-ut',
  # Shell
  'ghq',
  # Applications
  'google-chrome',
  'slack-desktop',
  'jetbrains-toolbox',
  'visual-studio-code-bin',
  'gpmdp',
  'station',
].each do |name|
  yay name
end

dotfile '.xprofile'

# .Xresources
# URxvt.font: xft:Dejavu Sans Mono-9,xft:IPAGothic

# i3
# exec --no-startup-id fcitx
# bindsym $mod+F2 exec google-chrome-stable
dotfile '.config/i3status'

include_cookbook 'git'

include_cookbook 'zsh'

service 'libvirtd' do
  action [ :start, :enable ]
end

service 'docker' do
  action [ :start, :enable ]
end

include_cookbook 'anyenv'

