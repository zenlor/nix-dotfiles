{ inputs
, lib
, config
, pkgs
, ... }:
{
  imports = [
    ./shell/zsh.nix
    ./programs/git.nix
    ./programs/fzf.nix
    ./programs/direnv.nix
    ./programs/tmux.nix
    ./lang/go.nix
    ./editors/neovim.nix
  ];

  home.packages = with pkgs; [
    age                 # encrypt all the things
    bat                 # modern cat
    bottom              # modern top/htop
    clojure-lsp         #  (for [lsp :in clojure])
    # devenv              # developer environment, nix for people with a deadline
    editorconfig-core-c # editorconfig to config editors for non-standard people
    entr                # run commands when file changed :: fd | entr make
    exa                 # modern ls
    fd                  # modern find
    fx                  # jq for mices
    gitui               # git terminal user interface
    hub                 # for git on the hub
    hugo                # to make websites
    ijq                 # interactive jq
    jq                  # grep json
    lua                 # lua for lpegging math
    navi                # cli cheatsheet
    ripgrep             # filtered faster grep
    rustup              # rusting
    tealdeer            # tldr
    xh                  # curl for humans
    shellcheck          # check these clams
    nixfmt              # nix needs formatting?
    zig                 # c for humans
  ];

  # more programs
  programs.keychain.enable = true;
  programs.home-manager.enable = true;
  programs.z-lua.enable = true;
  programs.direnv.enable = true;

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.stateVersion = "22.05";
}
