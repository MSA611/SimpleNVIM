vim.loader.enable() --impatient.nvim
vim.opt.hlsearch = true -- do not highlight all matches on previous search pattern
vim.opt.incsearch = true -- incrementally highlight searches as you type

vim.o.number = true -- enables number lines
vim.o.relativenumber = true -- enables relativenumber lines
vim.o.tabstop = 2 -- 2 spaces for tab-key
vim.o.autoindent = true -- autoindent easily
vim.o.smartindent = true -- smartindent
vim.o.shiftwidth = 2 -- 2 spaces for indentation
vim.o.wrap = true -- wrap the line
vim.o.laststatus = 3 -- status line
vim.o.ignorecase = true -- for non-case-sensitive search
vim.o.smartcase = true -- for upper-case search
vim.o.hlsearch = true -- true highlighting on search
vim.o.cursorline = false -- enable's the cursor line
vim.o.termguicolors = true -- use's terminal gui color's
vim.o.background = "dark" -- for dark background
vim.o.signcolumn = "yes" -- trust me bro (like it has to do with the indentation like ui)
vim.o.backspace = "indent,eol,start" -- just to work our backspace key properly
vim.o.splitright = true -- for splitting the window to right
vim.o.splitbelow = true -- for splitting the window to bottom
vim.o.backup = false -- to not take backup
vim.o.writebackup = false -- to not write a backup file
vim.o.swapfile = false -- not to save the file in swap
vim.o.scrolloff = 10 -- scroll before 10 line
vim.o.clipboard = "unnamedplus" -- to copy something from neovim to the system clipboard
vim.o.fillchars = "eob: " -- to remove tilder sign at the end of buffer "~"
vim.o.breakindent = true -- enable break indent
vim.o.undofile = true -- enable to undo which you have worked on
vim.o.showmode = false -- cause I am using lualine I don't need this

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Neovide Padding Opts
-- vim.g.neovide_padding_top = 20
-- vim.g.neovide_padding_bottom = 10
-- vim.g.neovide_padding_right = 15
-- vim.g.neovide_padding_left = 15
--
-- Create an augroup to avoid duplicate autocommands
local yank_group = vim.api.nvim_create_augroup("HighlightYank", { clear = true })

-- Setup autocommand to highlight on TextYankPost event
vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
	desc = "Highlight yanked text",
})
