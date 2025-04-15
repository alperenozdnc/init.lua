return {
    {
        "theprimeagen/harpoon"
    },
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.8",
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
    }
}
