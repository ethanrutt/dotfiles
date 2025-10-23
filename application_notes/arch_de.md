# DE
Previously, this was supposed to be a one step command to install everything on a system.

This is a lot of work to keep up and maintain, so I am going to shift gears with this a little bit

## Philosophy
I spent my time ricing `awesomewm` and while it was a lot of fun,
I realized there are better things to do. However, I still want a beautiful and
fun system.

For this reason, I have decided to go with [`HyDE`](https://github.com/HyDE-Project/HyDE) since it has a configuration
that I like and I don't have to worry about all the theming and stuff. These
dotfiles will change into just my terminal tools and maybe some applications
that I want to have installed. All of the other stuff will have to come from
the DE.

This also means that when setting up a new system, it will take more than one
command since you will have to manually configure all the DE, keybindings,
monitors, etc. But, this will be different per system anyway, so I don't feel
too bad about it.

## What I did on most recent arch reinstall
- `archinstall` script (cringe I know, I did it manually the first time I installed arch)
- `HyDE` install script (without `chaotic-aur`)
- changed keybindings in `~/.config/hypr/keybindings.conf`
- changed monitor in `~/.config/hypr/monitor.conf` to have resolution and refresh rate of current monitor
- removed some anime girls from `~/.config/fastfetch/logo/`
- installed dotfiles
- added `fcitx5` autostart in `~/.config/hypr/userprefs.conf`
- installed `uwsm` and `libnewt`
- changed all `exec` commands and `exec-once` to be `uwsm` managed
```hyprlang
# original
exec-once = mycommand --arg1 --arg2
bind = SUPER, E, exec, pcmanfm-qt.desktop
# uwsm managed
exec-once = uwsm app -- mycommand --arg1 --arg2
bind = SUPER, E, exec, uwsm app -- pcmanfm-qt.desktop
```
- choose `Hyprland uwsm-managed` in display manager when logging in
- deleted suspend listener in `~/.config/hypr/hypridle.conf`

## References
- [HyDE](https://github.com/HyDE-Project/HyDE)

# Another Switch
After using HyDE for a while, I have decided to move once again to [Omarchy](https://omarchy.org/)

The main reason for doing this is that hyde had a screen issue where after
having my computer on for a while, the screen would eventually start black
screening for about a minute every 5 minutes unless I reboot.

I also think Omachy is a more feature rich system

## What I did on most recent arch reinstall
- Install Omarchy iso
- Install dotfiles
- Map some new keybindings (in `~/.config/hypr/bindings.conf` under the "overwrite existing keybinds" section)

### New Keybindings

```hypr
unbind = SUPER, H
unbind = SUPER SHIFT, H
bind = SUPER, H, movefocus, l
bind = SUPER SHIFT, H, movewindow, l

unbind = SUPER, J
unbind = SUPER SHIFT, J
bind = SUPER, J, movefocus, d
bind = SUPER SHIFT, J, movewindow, d

unbind = SUPER, K
unbind = SUPER SHIFT, K
bind = SUPER, K, movefocus, u
bind = SUPER SHIFT, K, movewindow, u

unbind = SUPER, L
unbind = SUPER SHIFT, L
bind = SUPER, L, movefocus, r
bind = SUPER SHIFT, L, movewindow, r

bindd = SUPER SHIFT, S, Screenshot Region, exec, omarchy-cmd-screenshot
bindd = SUPER, M, Toggle split, togglesplit
```
