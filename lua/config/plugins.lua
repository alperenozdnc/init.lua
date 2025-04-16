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

require("telescope").setup {
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
        }
    }
}

require("telescope").load_extension("ui-select");

-- treesitter

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "python", "javascript", "typescript" },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
    }
}

-- undotree
vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle);

-- fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

-- lsp
require("mason").setup();

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "clangd", "pyright", "eslint" }
})

local lspconfig = require("lspconfig");


local null_ls = require("null-ls");

null_ls.setup({
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
});

local cmp = require("cmp");
require("luasnip.loaders.from_vscode").lazy_load();

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<TAB>'] = cmp.mapping.select_next_item(),
        ['<S-TAB>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = function()

        end,
        ['<Up>'] = function()

        end
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

local capabilities = require("cmp_nvim_lsp").default_capabilities();

lspconfig.lua_ls.setup({ capabilities = capabilities });
lspconfig.clangd.setup({ capabilities = capabilities });
lspconfig.eslint.setup({ capabilities = capabilities });
lspconfig.pyright.setup({ capabilities = capabilities });

local diagnostics = {
    virtual_text = true, -- Disable builtin virtual text diagnostic
    virtual_improved = {
        current_line = 'only',
    },
}

vim.diagnostic.config(diagnostics);
