# Dan's zsh config

A modern [zsh](https://www.zsh.org/) setup with [Antidote](https://antidote.sh/) + [Starship](https://starship.rs/).

## Installation

0.  Install a [Nerd Font](https://www.nerdfonts.com/) and configure your terminal to use the installed font.

1.  Install required packages - on Arch everything is available via [AUR](https://aur.archlinux.org/). For other OS / distributions, follow the upstream installation instructions.

        yay zsh zsh-antidote starship

2.  Make `zsh` your default shell

        chsh -s $(which zsh)

    Note: if you wish to run this command with `sudo`, you have to specify
    the current user:

        sudo chsh -s $(which zsh) $USER

3.  Clone this repo to your `$ZDOTDIR` location

        git clone git@github.com:dstockhammer/zsh.git ~/.config/zsh

4.  Create a `.zshenv` that configures zsh to use `$ZDOTDIR`

        cat << 'EOF' >| ~/.zshenv
        export ZDOTDIR=$HOME/.config/zsh
        [[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
        EOF

    Note: If you didn't install antidote via AUR, you'll have to configure the antidote dir. Add it to `.zshenv` before everything else: `export ANTIDOTE_DIR="/path/to/antidote"`

5.  Switch to `zsh` and enjoy 🌟🦄🌟

        zsh

    Alternatively, if you're already using `zsh`, completely restart your shell. **Do not** just reload your config with `source ~/.zshenv`.

## Misc

### WSL browser integration

To configure WSL to open browser URLs in Windows, you can use the `wslview` utility, which is a part of the `wslu` package.

    sudo apt install wslu

Configure `wslview` to open your browser of choice in Windows. Here is an example for Firefox:

    wslview -r $(wslpath -au 'C:\Program Files\Mozilla Firefox\firefox.exe')
