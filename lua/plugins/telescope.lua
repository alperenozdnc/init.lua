local builtin = require('telescope.builtin');

vim.keymap.set('n', '<leader>ff', builtin.find_files);
vim.keymap.set('n', '<leader>fg', builtin.git_files);
-- note that ripgrep should be installed for this keymap to work
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("grep > ") });
end)

return {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
};
