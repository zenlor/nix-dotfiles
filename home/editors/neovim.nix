{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

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
        ]
      ))

      vim-lastplace
      vim-vinegar
      vim-repeat
      vim-commentary
      vim-sneak
      vim-surround
      vim-fugitive
      vim-sleuth
      vim-eunuch

      terminus

      {
        plugin = bufferline-nvim;
        type = "lua";
        config = ''

          require("bufferline").setup{ }
          nmap("<leader>b", ":BufferLineCycleNext<cr>")
          nmap("<leader>B", ":BufferLineCyclePrev<cr>")
        '';
      }
    ];

    extraConfig = ''
    lua <<-EOF
      ${builtins.readFile ./neovim.lua}
    EOF
    '';
  };
}
