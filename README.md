# Dan's oh-my-zsh config

0.  Install a [Nerd Font](https://www.nerdfonts.com/) and configure your
    terminal to use the installed font.

1.  Install [zsh](https://www.zsh.org/)

        sudo apt install zsh

2.  Make `zsh` your default shell

        chsh -s $(which zsh)

    Note: if you wish to run this command with `sudo`, you have to specify
    the current user:

        sudo chsh -s $(which zsh) $USER

3.  Clone this repo **with all submodules** to `~`

        git clone --recurse-submodules git@github.com:dstockhammer/zsh.git ~/zsh

4.  Create a `.zshrc` that references the configuration in this repository

        echo 'source $HOME/zsh/.zshrc' > ~/.zshrc

5.  Switch to `zsh` and enjoy 🌟🦄🌟

        zsh

    Alternatively, if you're already using `zsh`, completely restart your shell.
    (**Do not** just reload your config with `source ~/.zshrc`)

6. Update ohmyzsh and all themes/plugins:

        ./scripts/update-deps.sh

## Windows Terminal + WSL

![](windows-terminal.png)

Settings for [Windows Terminal](https://github.com/microsoft/terminal) with
[WSL](https://docs.microsoft.com/en-us/windows/wsl/):

```javascript
{
    "guid": "{2c4de342-38b7-51cf-b940-2309a097f518}",
    "hidden": false,
    "name": "Ubuntu",
    "source": "Windows.Terminal.Wsl",
    "startingDirectory": "//wsl$/Ubuntu/home/daniel",
    "colorScheme": "Solarized Dark - Patched",
    "fontFace": "Hack NF",
    "fontSize": 12
}
```

Patched Solarized Dark theme from
[Windows Terminal Themes](https://atomcorp.github.io/themes/):

```javascript
{
    "name": "Solarized Dark - Patched",
    "black": "#002831",
    "red": "#d11c24",
    "green": "#738a05",
    "yellow": "#a57706",
    "blue": "#2176c7",
    "purple": "#c61c6f",
    "cyan": "#259286",
    "white": "#eae3cb",
    "brightBlack": "#475b62",
    "brightRed": "#bd3613",
    "brightGreen": "#475b62",
    "brightYellow": "#536870",
    "brightBlue": "#708284",
    "brightPurple": "#5956ba",
    "brightCyan": "#819090",
    "brightWhite": "#fcf4dc",
    "background": "#001e27",
    "foreground": "#708284"
}
```

### Browser integration

To configure WSL to open browser URLs in Windows, you can use the `wslview` utility, which is a part of the `wslu` package.

    sudo apt install wslu

Configure `wslview` to open your browser of choice in Windows. Here is an example for Firefox:

    wslview -r $(wslpath -au 'C:\Program Files\Mozilla Firefox\firefox.exe')


## Plugins and other tools

### pyenv

See https://github.com/pyenv/pyenv

**TL;DR** installation:

    curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

Finding and installing the latest python version:

```sh
# returns a list of 3.9.x versions.
pyenv install --list | grep 3.9

# take the latest version; let's say 3.9.1

# install a specific version
pyenv install 3.9.1

# set the installed version as global version
pyenv global 3.9.1

# check installed versions and confirm the new version is now global
pyenv versions

# never use `system` unless you know what you're doing!
```

### poetry

See https://github.com/python-poetry/poetry

**TL;DR** installation:

    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

### thefuck

See https://github.com/nvbn/thefuck

**TL;DR** installation:

```sh
sudo apt update && sudo apt install python3-dev python3-pip python3-setuptools

# make sure to switch to system python!
pyenv shell system

pip3 install thefuck

# restart your shell
```
