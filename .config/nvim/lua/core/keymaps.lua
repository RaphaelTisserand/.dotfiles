local keymaps = {}

function keymaps.utils()
	vim.keymap.set("n", "<leader>nh", "<CR>nohl<CR>", { desc = "Clear search highlights" })
	vim.keymap.set("n", "<leader>ex", "<CR>Ex<CR>", { desc = "File [EX]plorer" })
	vim.keymap.set("n", "<leader>h", "<CR>Stdheader<CR>", { desc = "42 [H]eader" })
	vim.keymap.set("n", "<leader>qa", "<CR>qa<CR>", { desc = "Exit nvim" })
	vim.keymap.set("n", "<leader>nt", "<CR>tabnew<CR>", { desc = "[N]ew [T]ab" })
end

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
function keymaps.navigation()
	vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
	vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
	vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
	vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
	vim.keymap.set('n', '<C-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
	vim.keymap.set('n', '<C-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
	vim.keymap.set('n', '<C-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
	vim.keymap.set('n', '<C-Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
end

-- window management
function keymaps.window()
	vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit window [V]ertically" })
	vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit window [F]orizontally" })
	vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make [S]plits [E]qual size" })
end

function keymaps.setup()
	keymaps.utils()
	keymaps.navigation()
	keymaps.window()
end

return keymaps
