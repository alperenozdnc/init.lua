return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = {
        ensure_installed = { "c", "lua", "python", "javascript", "typescript", "godot" },
        auto_install = true
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
