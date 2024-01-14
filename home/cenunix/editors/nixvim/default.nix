{ inputs
, outputs
, lib
, config
, pkgs
, ...
}:
let
  neovim = pkgs.neovim.override {
    # stupid defaults
    withPython3 = false;
    withRuby = false;
    configure = {
      customRC = ''
        lua << EOF
        ${builtins.readFile config/init.lua}
        ${builtins.readFile config/theme.lua}
        ${builtins.readFile config/treesitter.lua}
        ${builtins.readFile config/bufferline.lua}
        ${builtins.readFile config/maps.lua}
        ${builtins.readFile config/gitsigns.lua}
        ${builtins.readFile config/lualine.lua}
        ${builtins.readFile config/ui.lua}
        ${builtins.readFile config/lsp/lsp.lua}
        ${builtins.readFile config/lsp/completions.lua}
        ${builtins.readFile config/lsp/null-ls.lua}
        ${builtins.readFile config/neotree.lua}
      '';
      packages.myPlugins = with pkgs.vimPlugins;
        {
          start = [
            nvim-lspconfig
            nvim-cmp
            luasnip
            cmp_luasnip
            friendly-snippets
            cmp-nvim-lsp
            null-ls-nvim
            neo-tree-nvim
            nvim-web-devicons
            lualine-nvim
            bufferline-nvim
            which-key-nvim
            telescope-nvim
            gitsigns-nvim
            noice-nvim
            nui-nvim
            catppuccin-nvim
            (nvim-treesitter.withPlugins (p: [ p.c p.cpp p.nix p.lua ]))
          ];
        };
    };
  };
in
{
  config = {
    home.packages = with pkgs; [
      neovim
      neovide
      deadnix
      statix
      nil
      gopls
      clang-tools
      nodePackages.vscode-langservers-extracted
      prettierd
      alejandra
    ];
  };
}
