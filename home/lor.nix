{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./programs/tmux.nix
  ];

  home = {
    username = "lor";
    homeDirectory = "/home/lor";
  };

  home.sessionPath = [
    "$HOME/lib/bin"
    "$HOME/.local/bin"
    "$HOME/.emacs.d/bin"
    "$HOME/.luarocks/bin"
  ];

  home.packages = with pkgs; [
    luarocks
    shellcheck
    babashka # fast clojure
  ];

  programs.keychain = {
    agents = [ "ssh" ];
    keys = [ "id_rsa"
             "id_ecdsa"
             "id_ed25519"
             "id_frenzart.com"
           ];
  };

  programs.git = {
    userName = "Lorenzo Giuliani";
    userEmail = "lorenzo@frenzart.com";
    signing = {
      key = "key::${(builtins.readFile ./lor.pub)}";
    };
  };

  home.file = {
    ".ssh/allowed-signers" = {
      text = "lorenzo@frenzart.com ${(builtins.readFile ./lgiuliani.pub)}";
    };
  };
}
