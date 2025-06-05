-- Some utils
vim.keymap.set("n", "<leader>nh", "<CMD>nohl<CR>", { desc = "[N]o [H]ighlights" })
vim.keymap.set("n", "<leader>ex", "<CMD>Ex<CR>", { desc = "File [EX]plorer" })
vim.keymap.set("n", "<leader>h", "<CMD>Stdheader<CR>", { desc = "42 [H]eader" })
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>", { desc = "[Q]uit" })
vim.keymap.set("n", "<leader>qa", "<CMD>qa<CR>", { desc = "[Q]uit [A]ll" })
vim.keymap.set("n", "<leader>nt", "<CMD>tabnew<CR>", { desc = "[N]ew [T]ab" })
vim.keymap.set("n", "<leader>qt", "<CMD>closetab<CR>", { desc = "[Q]uit [T]ab" })
vim.keymap.set("n", "<leader>w", "<CMD>w<CR>", { desc = "[W]rite" })
vim.keymap.set("n", "<leader>wa", "<CMD>wa<CR>", { desc = "[W]rite [A]ll" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit window [V]ertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit window [F]orizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make [S]plits [E]qual size" })
