vim.g.mapleader = " ";

function keymap(mode, bind, action, opts)
	vim.api.nvim_set_keymap(mode, bind, action, opts);
end

-- normal mode
keymap("n", "<leader>w", ":w<CR>", { noremap = true }); -- writes changes
keymap("n", "<leader>e", ":Ex<CR>", { noremap = true }); -- opens file explorer
keymap("n", "<leader>q", ":q<CR>", { noremap = true }); -- opens file explorer

-- config options
keymap("n", "<leader>cl", ":so %<CR>", { noremap = true, silent = true }); -- loads config changes
keymap("n", "<leader>ce", ":e /home/xeptao/.config/nvim<CR>", { noremap = true, silent = true }) -- opens config folder

-- insert mode
keymap("i", "jj", "<ESC>", { noremap = true, silent = true });
