return {
    {
        "theprimeagen/harpoon"
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = true,
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        "mbbill/undotree",
    },
    {
        "tpope/vim-fugitive",
    },
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "nvim-telescope/telescope-ui-select.nvim"
    },
    {
        "nvimtools/none-ls.nvim"
    },
    {
        "hrsh7th/nvim-cmp",
    },
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets"
        }
    },
    {
        "m4xshen/autoclose.nvim"
    }
}
