include_role 'base'
include_cookbook 'yay'

package 'otf-ipafont'
package 'adobe-source-han-sans-jp-fonts'
# .Xresources
# URxvt.font: xft:Dejavu Sans Mono-9,xft:IPAGothic

yay 'fcitx-mozc-neologd-ut'
package 'fcitx-configtool'
package 'fcitx-im'
dotfile '.xprofile'
# exec --no-startup-id fcitx

dotfile '.config/i3status'

yay 'google-chrome'
# bindsym $mod+F2 exec google-chrome-stable
yay 'slack-desktop'
yay 'jetbrains-toolbox'
yay 'visual-studio-code-bin'

include_cookbook 'zsh'
