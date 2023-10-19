--vim.wo.number = true
vim.o.number = true
vim.o.breakindent = true                          -- Lines longer than one are indented indetitically
vim.o.clipboard = 'unnamedplus'
vim.o.hlsearch = true
vim.o.mouse = 'a'
vim.o.undofile = true                             -- Save undo history
vim.o.scrolloff = 10

vim.o.ignorecase = true
vim.o.smartcase = true                            -- Case-insensitive searching UNLESS \C or capital in search

vim.o.signcolumn = 'yes'                          -- Keep signcolumn on by default (the one on the left, before line numbers)

vim.o.updatetime = 300                            -- faster something?, Decrease update time
vim.o.timeoutlen = 300                            -- the time that Vim waits for after each keystroke of the mapping before aborting it
                                                  -- see also: timout & https://vi.stackexchange.com/questions/24925/usage-of-timeoutlen-and-ttimeoutlen
vim.o.completeopt = 'menuone,noselect'            -- Set completeopt to have a better completion experience
vim.o.termguicolors = true                        -- NOTE: You should make sure your terminal supports this

vim.o.pumheight = 10                              -- limits the height of pop-up menu to 10
vim.o.showtabline = 2                             -- show tabs at the top even if there is only one
vim.o.expandtab = true                            -- doesn't work
vim.o.tabstop = 2                                 -- this neither

vim.opt.iskeyword:append('-')                     -- treats sth-sth as one word (useful for w motion)
