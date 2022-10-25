{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./programs/tmux.nix
    ./lang/clojure.nix
  ];

  home = {
    username = "lor";
    homeDirectory = "/home/lor";
  };


  home.sessionPath = ["$HOME/lib/bin" "$HOME/.local/bin" "$HOME/.emacs.d/bin"];

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
      key ="key::ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDO4vpKL4UUOAm9g92tn+Ez6c+zPum4dxm7ocVlyGDskC0/lKa/i+fG/hzzWH3TLvolhyCvzByswGj/eXDnEURaY5yfjd65i7EQGz7GSZb8XCS1/nG7/zdxantsw4a8YdnSDKzCgNWfveXYwmxT9mJi+3jcUbvkL6qTZy9r+Pm+ovmzEwOQex8tx+OCJyfaoD3VjrzWqIW6o16vua5akgs2BnFOMhLkLutf4MoB20ZuXV6RN8A7XoCcQiqxMV68p7z2ACKuXQyuh/UkJARSRKTURLbF00YF9NVh3FNSXOj9m5Nhh8d4P1dGvI1xXZjYF7+YYt4y/dpYS6GIpr3zzkFh lorenzo@frenzart.com";
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
}
