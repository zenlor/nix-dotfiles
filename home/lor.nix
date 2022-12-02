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
  ];

  home.packages = with pkgs; [
    babashka # fast clojure
  ];

  programs.keychain = {
    agents = [ "ssh" ];
    keys = [ "id_rsa"
             "id_frenzart.com"
             "id_ecdsa"
           ];
  };

  programs.git = {
    userName = "Lorenzo Giuliani";
    userEmail = "lorenzo@frenzart.com";
    signing = {
      key = "key::${(builtins.readFile ./lor.pub)}";
    };
  };

  programs.ssh = {
    matchBlocks = {
      mac = {
        hostname = "192.168.1.184";
        user = "lgiuliani";
      };
      nas = {
        hostname = "192.168.1.1";
        user = "lor";
      };
    };
  };

  home.file = {
    ".ssh/allowed-signers" = {
      text = "lorenzo@frenzart.com ${(builtins.readFile ./lgiuliani.pub)}";
    };
  };
}
