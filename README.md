# .dotfiles

This repository contains my personal dotfiles, including preconfigured settings for Neovim, tailored specifically for TypeScript, Rust, Zig, Go development. It includes a curated selection of plugins, key mappings, and customizations to enhance productivity and streamline coding workflows.

### Vim re-maps
[CHEATSHEET.md](CHEATSHEET.md)

### Getting started
```shell
stow --target ~/.config .
```

### Preview
![preview-rose-pine](rose-pine.png "rose-pine theme")

|                     |                                                                           |
|---------------------|---------------------------------------------------------------------------|
|Shell:               |[zsh](https://www.zsh.org/) + [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)|
|Editor:              |[neovim](https://github.com/neovim/neovim)                                 |
|Terminal:            |ghostty                     |
|Terminal-Multiplexer:|[zellij](https://github.com/zellij-org/zellij)                             |

**Optional**, but highly recommended:

* [fzf](https://github.com/junegunn/fzf)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [jq](https://github.com/stedolan/jq)
* [nvim kickstarter](https://github.com/nvim-lua/kickstart.nvim)

## Themes

|                                                         |                                                 |
|---------------------------------------------------------|-------------------------------------------------|
|[rose-pine](https://github.com/rose-pine/neovim)         | <img src="rose-pine.png" alt="rose-pine theme" width="330" height="250" title="rose-pine theme">  |
|[tokyonight](https://github.com/folke/tokyonight.nvim)   |<img src="tokyonight.png" alt="tokyonight theme" width="330" height="250" title="tokyonight theme">  |
|[gruvbox](https://github.com/ellisonleao/gruvbox.nvim)   |<img src="gruvbox.png" alt="gruvbox theme" width="330" height="250" title="gruvbox theme">  |

## Switch theme

To swich the theme in a more simple way, we are using a simple bash script by just calling this alias.

```shell
colorscheme tokyonight
```


