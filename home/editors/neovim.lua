require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		additional_vim_regex_highliting = false,
	}
}

-- mini
require'mini.basics'.setup{
    options = {
	basic = true,
	extra_ui = true,
	win_borders = 'single',
    },
}

require'mini.base16'.setup{
    palette = require'mini.base16'.mini_palette('#112641', '#e2e98f', 75),
    use_cterm = false,
    plugins = {
	default = true,
    },
}

require'mini.hipatterns'.enable()
require'mini.animate'.setup{}
require'mini.bracketed'.setup{}
require'mini.fuzzy'.setup{}
require'mini.pairs'.setup{}
require'mini.surround'.setup{}

-- require'mini.files'.setup{}
-- vim.keymap.set('n', '-', function() MiniFiles.open() end)

require'mini.tabline'.setup{
    show_icons = true,
}

require'mini.statusline'.setup{
    set_vim_settings = true,
}

-- Doom-like keybindings
vim.keymap.set('n', '<Leader>bs', '<cmd>w<cr>')
-- window movement
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- buffers
vim.keymap.set('n', '<Leader>b', '<cmd>BufferLineCycleNext<cr>')
vim.keymap.set('n', '<Leader>b', '<cmd>BufferLineCyclePrev<cr>')
-- fixes
vim.keymap.set('n', '<esc><esc>', '<cmd>nohl<cr>')
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
-- fzf
vim.keymap.set('n', '<Leader><space>', '<cmd>Files<cr>')
vim.keymap.set('n', '<Leader>a', '<cmd>Buffers<cr>')
vim.keymap.set('n', '<Leader>?', '<cmd>History<cr>')
