require('null-ls').setup {
    sources = {
    require('null-ls').builtins.formatting.alejandra,
    require('null-ls').builtins.formatting.stylua,
    require('null-ls').builtins.formatting.prettierd,
    require('null-ls').builtins.formatting.black,
    require('null-ls').builtins.formatting.isort,
    require('null-ls').builtins.diagnostics.eslint_d,
    require('null-ls').builtins.diagnostics.deadnix,
    }
}