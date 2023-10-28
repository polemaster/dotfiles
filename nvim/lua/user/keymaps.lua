-- Options passed to vim.keymap.set()
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- My custom keymaps
keymap('n', '<c-a>', 'ggVG', opts)
keymap('n', '<leader>z', 'za', opts)
keymap('', '<S-j>', '<Nop>', opts)

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 1 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Stay in indent mode after < or >
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- After selecting text and pasting sth there, the selected text will not be yanked anymore.
keymap("v", "p", '"_dP', opts)

-- Nvimtree
keymap('n', '<leader>e', ':NvimTreeToggle<cr>', opts)

-- Terminal --
-- Useful when terminal is horizontal or vertical (not float) to move between windows
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize buffers with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation
-- Bufferline
-- keymap('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', opts)
-- keymap('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', opts)
-- keymap('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', opts)
-- keymap('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', opts)
-- keymap('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', opts)
-- keymap('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', opts)
-- keymap('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', opts)
-- keymap('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', opts)
-- keymap('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', opts)
-- keymap('n', '<A-0>', '<Cmd>BufferLineGoToBuffer -1<CR>', opts)
--
-- keymap('n', '<S-l>', ':BufferLineMoveNext<CR>', opts)
-- keymap('n', '<S-h>', ':BufferLineMovePrev<CR>', opts)
--
-- keymap('n', '<A-l>', ':BufferLineCycleNext<CR>', opts)
-- keymap('n' ,'<A-h>', ':BufferLineCyclePrev<CR>', opts)

-- use bp|bd # or bp|sp|bn|bd to delete a buffer
-- keymap('n', '<A-c>', ':bd<cr>', opts)

-- Barbar
keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

keymap('n', '<S-l>', ':BufferMoveNext<CR>', opts)
keymap('n', '<S-h>', ':BufferMovePrev<CR>', opts)

keymap('n', '<A-l>', ':BufferNext<CR>', opts)
keymap('n' ,'<A-h>', ':BufferPrev<CR>', opts)

-- use bp|bd # or bp|sp|bn|bd to delete a buffer (without bbye)
keymap('n', '<A-c>', ':BufferClose<CR>', opts)
keymap('n', '<A-S-c>', ':BufferRestore<CR>', opts)

-- Treesitter
-- more treesitter-textobjects keymaps are in treesitter.lua
local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')

keymap({'n', 'x', 'o'}, ';', ts_repeat_move.repeat_last_move)
keymap({'n', 'x', 'o'}, ',', ts_repeat_move.repeat_last_move_opposite)

keymap({'n', 'x', 'o'}, 'f', ts_repeat_move.builtin_f)
keymap({'n', 'x', 'o'}, 'F', ts_repeat_move.builtin_f)
keymap({'n', 'x', 'o'}, 't', ts_repeat_move.builtin_t)
keymap({'n', 'x', 'o'}, 'T', ts_repeat_move.builtin_T)



-- Telescope
-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')

keymap('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10, -- ???
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

keymap('n', '<leader>f', builtin.find_files, { desc = '[S]earch [F]iles' })
keymap('n', '<leader>s', builtin.live_grep, { desc = '[S]earch by [G]rep' })
keymap('n', 'gd', builtin.lsp_definitions, { desc = '[G]o to [D]efinition' })
keymap('n', '<leader>k', builtin.keymaps, { desc = 'Search [K]eymaps' })

keymap('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
keymap('n', '<leader>gc', builtin.git_commits, { desc = 'Search [G]it [C]ommits' })
keymap('n', '<leader>d', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

keymap('n', '<space>t', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', opts)

-- Useful telescope mappings:
-- <C-x> or <C-s> 	        Go to file selection as a split
-- <C-v>                 	Go to file selection as a vsplit
