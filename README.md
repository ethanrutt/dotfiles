# Ethan's dots

## Usage

> [!WARNING]
> This is not meant to be a way to set up your system. This is only for Ethan's
> needs, and will probably not work without my machines. This is public to
> serve as a potential guide for those interested, or just to see some of my
> work. If you follow the steps below, there is a low chance that everything
> will work, since you need an ssh key added to my github account since I use
> submoduled private repositories. If you are able to do that, then I have a
> huge problem on my hands (LOL).

> [!NOTE]
> This is now just a dotfiles repository. This assumes that you already have a
> window manager or desktop environment set up. I changed it because I can't be
> bothered to spend a lot of time keeping a wm configuration rice updated.
> see [arch de](/application_notes/arch_de.md)

First, [add an ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

Then, this oneliner should set up all terminal tools and some fun applications
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ethanrutt/dotfiles/master/bin/dots)"
```
> [!NOTE]
> Make sure to have `curl` installed before running.

> [!NOTE]
> I only really use Ubuntu/Debian in WSL or a VM, so I don't have it configured
> to set up everything, just the command line tools I use. Same with using Arch
> in WSL mode, it will only setup the command line tools and `yay`.

This will setup the dots dir in `$HOME/.dots` and it will also add the `bin`
folder to your path, allowing you to run this command at any point to sync all
dotfiles again with the upstream repository
```sh
dots
```

## Packages and Complexity
> [!NOTE]
> Complexity level means how much is involved in installing the package.
> - Level 0 - Install package
> - Level 1 - Also link config files
> - Level 2 - Also install dependencies and/or do some extra commands
> - Level 3 - Anything more complex than that

| Package Name  | Debian Complexity Level | Arch WSL Complexity Level| Arch Complexity Level|
| ------------- | ----------------------- | ------------------------ | -------------------- |
| nvm | 3 | 3 | 3 |
| nvim | 3 | 2 | 2 |
| delta | 3 | 2 | 2 |
| bat | 3 | 2 | 2 |
| eza | 3 | 0 | 0 |
| git | 2 | 1 | 1 |
| fd | 2 | 0 | 0 |
| fzf | 2 | 0 | 0 |
| sh | 1 | 1 | 1 |
| tmux | 1 | 1 | 1 |
| yay | n/a | 3 | 3 |
| obsidian | n/a | n/a | 1 |
| wallpapers | n/a | n/a | 1 |
| fcitx5 | n/a | n/a | 0 |
| spotify | n/a | n/a | 0 |
| discord | n/a | n/a | 0 |
| bitwarden | n/a | n/a | 0 |
| below are 0 complexity but installed with `yay` | n/a | n/a | n/a |
| keymapp | n/a | n/a | 0 |
