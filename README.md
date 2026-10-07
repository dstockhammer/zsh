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
        [[ -f \$ZDOTDIR/.zshenv ]] && . \$ZDOTDIR/.zshenv
        EOF

    Note: If you didn't install antidote via AUR, you'll have to configure the antidote dir. Add it to `.zshenv` before everything else: `export ANTIDOTE_DIR="/path/to/antidote"`

5.  Switch to `zsh` and enjoy 🌟🦄🌟

        zsh

    Alternatively, if you're already using `zsh`, completely restart your shell. **Do not** just reload your config with `source ~/.zshenv`.

## Misc

### UTF-8 locale

The Starship prompt uses Unicode symbols; an ASCII locale can make typed text overwrite the prompt. At startup, `.zshrc` keeps an existing UTF-8 locale or automatically selects a supported one, preferring `C.UTF-8`. It sets `LC_CTYPE`, or updates `LC_ALL` if that override is already set. This applies to the shell and its child processes, without changing system settings.

If no supported UTF-8 locale is available, `.zshrc` stops initialization with a nonzero status and prints instructions for installing or generating one. On Debian/Ubuntu, install `locales` with `sudo apt install locales`. On Debian/Ubuntu/Arch, uncomment `en_US.UTF-8 UTF-8` in `/etc/locale.gen` and run `sudo locale-gen`. After restarting the shell, `locale charmap` should report UTF-8.

### WSL browser integration

To configure WSL to open browser URLs in Windows, you can use the `wslview` utility, which is a part of the `wslu` package.

    sudo apt install wslu

Configure `wslview` to open your browser of choice in Windows. Here is an example for Firefox:

    wslview -r $(wslpath -au 'C:\Program Files\Mozilla Firefox\firefox.exe')
