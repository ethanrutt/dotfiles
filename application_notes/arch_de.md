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

## References
- [HyDE](https://github.com/HyDE-Project/HyDE)
