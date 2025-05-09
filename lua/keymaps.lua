vim.g.mapleader = " ";

function keymap(mode, bind, action, opts)
    vim.api.nvim_set_keymap(mode, bind, action, opts);
end

-- normal mode
vim.keymap.set("n", "<leader>w", function()
    vim.lsp.buf.format { async = false };
    vim.cmd("w");
end, { noremap = true });                                         -- writes changes

keymap("n", "<leader>e", ":Ex<CR>", { noremap = true });          -- opens file explorer
keymap("n", "<leader>q", ":q<CR>", { noremap = true });           -- opens file explorer
keymap("n", "<C-j>", "<C-d>", { noremap = true, silent = true }); -- moves half page down
keymap("n", "<C-k>", "<C-u>", { noremap = true, silent = true }); -- moves half page up

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])                -- copy selection to keyboard
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover);
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename);
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action);
vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references);
vim.keymap.set("n", "gd", vim.lsp.buf.definition);
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format { async = true };
end)

-- config options
keymap("n", "<leader>cl", ":so %<CR>", { noremap = true, silent = true });                       -- loads config changes
keymap("n", "<leader>ce", ":e /home/xeptao/.config/nvim<CR>", { noremap = true, silent = true }) -- opens config folder

-- insert mode
keymap("i", "jj", "<ESC>", { noremap = true, silent = true });

-- visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap("v", "<Tab>", ">gv", { noremap = true, silent = true })   -- indent selection in
keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true }) -- indent selection out
