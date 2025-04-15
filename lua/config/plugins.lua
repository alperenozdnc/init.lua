-- harpoon
local mark = require("harpoon.mark");
local ui = require("harpoon.ui");

vim.keymap.set("n", "<leader>a", mark.add_file);
vim.keymap.set("n", "<leader>m", ui.toggle_quick_menu, {});
vim.keymap.set("n", "<leader>j", function() ui.nav_file(1) end);
vim.keymap.set("n", "<leader>k", function() ui.nav_file(2) end);
vim.keymap.set("n", "<leader>l", function() ui.nav_file(3) end);
vim.keymap.set("n", "<leader>;", function() ui.nav_file(4) end);

-- telescope

local builtin = require('telescope.builtin');

vim.keymap.set('n', '<leader>ff', builtin.find_files);
vim.keymap.set('n', '<leader>fg', builtin.git_files);
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("grep > ") });
end)

-- treesitter

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "python", "javascript", "typescript" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- undotree
vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)

-- fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
