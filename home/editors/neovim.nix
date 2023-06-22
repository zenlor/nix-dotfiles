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

      # vim-sensible
      # vim-lastplace
      # vim-vinegar
      # vim-repeat
      # vim-commentary
      # vim-sneak
      # vim-surround
      # vim-fugitive
      # vim-sleuth
      # vim-eunuch

      fzf-vim
      fzfWrapper

      terminus

      # neocomplete
      deoplete-nvim

      # ui
      bufferline-nvim
      lualine-nvim
      mini-nvim
    ];

    # extraConfig = builtins.readFile ./neovim.vim;
    extraLuaConfig = builtins.readFile ./neovim.lua;
  };
}
