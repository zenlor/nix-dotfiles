{ inputs
, lib
, config
, pkgs
, ... }:
{
  imports = [
    ./shell/zsh.nix
    ./programs/git.nix
    ./programs/ssh.nix
    ./programs/fzf.nix
    ./programs/direnv.nix
    ./programs/tmux.nix
    ./lang/go.nix
    ./editors/neovim.nix
  ];

  home.packages = with pkgs; [
    ripgrep  # filtered faster grep
    fd       # modern find
    bat      # modern cat
    exa      # modern ls
    age      # encrypt all the things
    gitui    # git terminal user interface
    jq       # grep json
    ijq      # interactive jq
    fx       # jq for mices
    bottom   # modern top/htop
    entr     # run commands when file changed :: fd | entr make
    navi     # cli cheatsheet
    tealdeer # tldr
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
