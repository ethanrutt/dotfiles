# `fcitx` IME Setup

## Locale

> [!NOTE]
> This must be done manually

First, the locale must be generated. This can be done by going to
`/etc/locale.gen` and uncommenting the `ja_JP.UTF-8 UTF-8` line, saving the
file, then running `sudo locale-gen`.
```bash
sudo vim /etc/locale.gen
# find the line that says `ja_JP.UTF-8 UTF-8` and uncomment, save and exit
sudo locale-gen
```

## Environment Variables
This should already be configured since they are in other parts of the
dotfiles, but is required as well

You need to set environment variables in your startup shell. Mine is in
`.bash_profile` for arch
```bash
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
```

## Startup
This should already be configured since they are in other parts of the
dotfiles, but is required as well

In startup of window manager, you need to run `fcitx` in the background
```bash
fcitx -d # start fcitx in daemon mode
```
This is done in my `awesomewm` config in `startup.lua`
```lua
awful.spawn("fcitx -d")
```

## Using `mozc`

> [!NOTE]
> This must be done manually

Either
- in your system tray, right click the keyboard icon and click `configure`
- run `fcitx-configtool`

Then
- Click the `+` in the bottom left to add a new input method
- Unclick the `Only Show Current Language` checkbox
- Find `mozc`
- Add it to the list

Now you can press `C-<space>` and it should switch IME to Japanese
