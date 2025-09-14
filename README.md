# SimpleNVIM

## Installation

**MacOS and Linux**

```bash
git clone https://github.com/MSA611/SimpleNVIM.git ~/.config/nvim && nvim
```

## Uninstallation

**Linux / MacOS (Unix)**

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

**Flatpak (Linux)**

```bash
rm -rf ~/.var/app/io.neovim.nvim/config/nvim
rm -rf ~/.var/app/io.neovim.nvim/data/nvim
rm -rf ~/.var/app/io.neovim.nvim/.local/state/nvim
```

---

## Configuration Notes

- **Which Key**: To enable the `which-key` plugin, uncomment the lines in `lua/plugins/whichKey.lua`.
- **Indentation Guides**: For enhanced indentation guides, uncomment the lines in `lua/plugins/indent-blankline.nvim.lua`.
- **Dependencies**: For Telescope to function correctly, ensure `fd` and `ripgrep` are installed.

---

## Keymaps

### General

| Keybinding     | Action                   |
| :------------- | :----------------------- |
| `<leader>l`    | Open Lazy                |
| `<leader>cm`   | Open Mason               |
| `<Esc>`        | Clear Search Highlight   |
| `gco`          | Add Comment Below        |
| `gcO`          | Add Comment Above        |
| `jj`           | Escape Insert Mode       |
| `<C-s>`        | Save File                |
| `y`            | Copy to System Clipboard |
| `j` / `<Down>` | Move Down (Wraps Lines)  |
| `k` / `<Up>`   | Move Up (Wraps Lines)    |
| `<A-j>`        | Move Line Down           |
| `<A-k>`        | Move Line Up             |

### Window Management

| Keybinding   | Action                        |
| :----------- | :---------------------------- |
| `<leader>wh` | Go to Left Window             |
| `<leader>wj` | Go to Lower Window            |
| `<leader>wk` | Go to Upper Window            |
| `<leader>wl` | Go to Right Window            |
| `<leader>ww` | Switch to Next Window         |
| `<leader>wL` | Move Window to Far Right      |
| `<leader>wH` | Move Window to Far Left       |
| `<leader>wK` | Move Window to Top            |
| `<leader>ws` | Split Window Below            |
| `<leader>wv` | Split Window Right            |
| `<leader>wd` | Delete Window                 |
| `<leader>wx` | Swap Current Window with Next |
| `<leader>we` | Equalize Window Sizes         |
| `<C-k>`      | Increase Window Height        |
| `<C-j>`      | Decrease Window Height        |
| `<C-l>`      | Decrease Window Width         |
| `<C-h>`      | Increase Window Width         |

### Vim Maximizer

| Keybinding   | Action                  |
| :----------- | :---------------------- |
| `<leader>wm` | Maximize/Minimize Split |

### Buffer Management

| Keybinding               | Action                   |
| :----------------------- | :----------------------- |
| `<S-h>` / `[b`           | Previous Buffer          |
| `<S-l>` / `]b`           | Next Buffer              |
| `<leader>bb` / <leader>` | Switch to Other Buffer   |
| `<leader>bd`             | Delete Buffer            |
| `<leader>bD`             | Delete Buffer and Window |
| `<leader>bo`             | Delete Other Buffers     |

### Diagnostics

| Keybinding   | Action                |
| :----------- | :-------------------- |
| `<leader>cd` | Show Line Diagnostics |
| `]d`         | Next Diagnostic       |
| `[d`         | Previous Diagnostic   |
| `]e`         | Next Error            |
| `[e`         | Previous Error        |
| `]w`         | Next Warning          |
| `[w`         | Previous Warning      |
| `<leader>xq` | Toggle Quickfix List  |
| `<leader>xl` | Toggle Location List  |

### Telescope

| Keybinding        | Action                |
| :---------------- | :-------------------- |
| `<leader><space>` | Find Files (Root Dir) |
| `<leader>/`       | Text Grep (Root Dir)  |
| `<leader>,`       | Switch Buffer         |
| `<leader>:`       | Command History       |
| `<leader>ff`      | Find Files            |
| `<leader>gf`      | Find Git Files        |
| `<leader>fr`      | Recent Files          |
| `<leader>fb`      | Buffers               |
| `<leader>fh`      | Help Tags             |
| `<leader>fk`      | Key Maps              |
| `<leader>fd`      | Workspace Diagnostics |
| `<leader>gs`      | Git Status            |
| `<leader>gl`      | Git Commits (Log)     |

### NeoTree (File Explorer)

| Keybinding                 | Action                         |
| :------------------------- | :----------------------------- |
| `<leader>fe` / `<leader>e` | Explorer NeoTree (Root Dir)    |
| `<leader>fE` / `<leader>E` | Explorer NeoTree (Current Dir) |
| `<leader>ge`               | Git Explorer                   |
| `<leader>be`               | Buffer Explorer                |

### Trouble

| Keybinding   | Action                            |
| :----------- | :-------------------------------- |
| `<leader>xx` | Toggle Diagnostics                |
| `<leader>xX` | Toggle Buffer Diagnostics         |
| `<leader>cs` | Toggle Symbols                    |
| `<leader>cl` | Toggle LSP Definitions/References |
| `<leader>xL` | Toggle Location List              |
| `<leader>xQ` | Toggle Quickfix List              |

### ToggleTerm (Terminal)

| Keybinding | Action                   |
| :--------- | :----------------------- |
| `<c-_>`    | Toggle Floating Terminal |

### LazyGit

| Keybinding   | Action       |
| :----------- | :----------- |
| `<leader>gg` | Open LazyGit |

### Conform

| Keybinding   | Action                   |
| :----------- | :----------------------- |
| `<leader>cf` | Format File or Selection |

### Flash

| Keybinding | Action            |
| :--------- | :---------------- |
| `s`        | Jump              |
| `S`        | Treesitter Jump   |
| `r`        | Remote Jump       |
| `R`        | Treesitter Search |
| `<c-s>`    | Toggle Search     |

### Mini Surround

| Keybinding | Action                 |
| :--------- | :--------------------- |
| `gsa`      | Add Surrounding        |
| `gsd`      | Delete Surrounding     |
| `gsf`      | Find Right Surrounding |
| `gsF`      | Find Left Surrounding  |
| `gsh`      | Highlight Surrounding  |
| `gsr`      | Replace Surrounding    |
| `gsn`      | Update `n_lines`       |

