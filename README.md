### Installation In MacOs And Linux

```
git clone https://github.com/MSA611/SimpleNVIM.git ~/.config/nvim && nvim
```

### Uninstallation

```# Linux / MacOS (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Flatpak (linux)
rm -rf ~/.var/app/io.neovim.nvim/config/nvim
rm -rf ~/.var/app/io.neovim.nvim/data/nvim
rm -rf ~/.var/app/io.neovim.nvim/.local/state/nvim

```

#### If You Require Which Key Then Un Comment whichKey.lua from lua/plugins/whichKey.lua

#### If You Like Beautiful Indentation then you can Uncomment the lines present in lua/plugins/indent-blankline.nvim.lua
