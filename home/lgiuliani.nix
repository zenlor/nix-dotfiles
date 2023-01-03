{ inputs
, lib
, config
, pkgs
, ... }: {
  home = {
    username = "lgiuliani";
    homeDirectory = "/Users/lgiuliani";
  };

  home.sessionVariables = {
    LANG = "en_US.UTF-8"; # for whatever reason osx doesn't set it
  };

  home.sessionPath = [
    "/opt/homebrew/bin"  # homebrew handled by darwin-nix
    "/opt/homebrew/sbin" # ^
    "/usr/local/bin"     # this should be default
    "$HOME/lib/bin"      # the go $PATH
    "$HOME/bin"          # maybe useful
    "$HOME/.local/bin"   # Locally installed ... like janet-dev
    "$HOME/.emacs.d/bin" # Doom
    "$HOME/.cargo/bin"   # Cargo/Rust
    "$HOME/.rd/bin"      # RancherDesktop
  ];

  home.packages = with pkgs; [
    awscli2        # the worst official aws cli
    tfswitch       # manage multiple versions of terraform
    k9s            # nicer kubectl
    ktunnel        # tunnel k8s services to/from your 127.0.0.1
    terranix       # write derivations not hcl
    terraform-ls   # lsp for terraformation
    babashka       # fast clojure
    terraform-docs # documentation for terraform things
    pre-commit     # overengineered frameworks for simple things :facepalm:
    autossh        # things to automatically ssh tunnels to tunnel things
  ];

  programs.git = {
    userName = "Lorenzo Giuliani";
    userEmail = "lgiuliani@malwarebytes.com";

    signing = {
      key = "key::${(builtins.readFile ./lgiuliani.pub)}";
    };
  };

  programs.keychain = {
    agents = [ "ssh" ];
    keys = [ "id_rsa"
             "id_ecdsa"
             "id_ed25519"
             "id_frenzart.com"
             "id_mwb"
             "id_mac"
           ];
  };

  programs.go = {
    goPrivate = [ "github.com/Malwarebytes" ];
  };

  home.file = {
    ".ssh/allowed-signers" = {
      text = "lgiuliani@malwarebytes.com ${(builtins.readFile ./lgiuliani.pub)}";
    };
  };
}
