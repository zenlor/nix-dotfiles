{ config
, lib
, pkgs
, ... }:
{
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = [
      pkgs.shfmt
      pkgs.fzf
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      mini-nvim

      # tpope
      vim-fugitive
      vim-vinegar

      # languages
      vim-nix
      vim-go
      vim-terraform

      (nvim-treesitter.withPlugins (
        plugins: with plugins; [
          tree-sitter-nix
          tree-sitter-python
          tree-sitter-clojure
          tree-sitter-zig
          tree-sitter-rust
          tree-sitter-go
          tree-sitter-hcl
        ]
      ))

      # ux
      fzf-vim
      fzfWrapper
      terminus
    ];

    # extraConfig = builtins.readFile ./neovim.vim;
    extraLuaConfig = builtins.readFile ./neovim.lua;
  };
}
