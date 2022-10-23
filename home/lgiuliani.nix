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

  home.packages = with pkgs; [
    awscli2  # the worst official aws cli
    tfswitch # manage multiple versions of terraform
    k9s      # nicer kubectl
    ktunnel  # tunnel k8s services to/from your 127.0.0.1
    terranix # write derivations not hcl
  ];

  programs.git = {
    userName = "Lorenzo Giuliani";
    userEmail = "lgiuliani@malwarebytes.com";

    signing = {
      key = "key::ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBABLDbeczvNJj/1gQ6M7AYghHTr9pm58t4bGYK9I4aU8EQsFuuO+e2sTo08Vg7cnebPEu3hCzrdzbTs+r/GJmfaT3AC86h1KKG9Gpz60aC3LTNb6R3Bn5qMemryjcbGQsxv+tydS6+38z3I3aT7V3jWAzghk3yShVEW6OucCE9hhZlnw4A== lgiuliani@malwarebytes.com";
    };
  };

  programs.keychain = {
    agents = [ "ssh" ];
    keys = [ "id_rsa"
             "id_frenzart.com"
             "id_ecdsa"
           ];
  };

  programs.go = {
    goPrivate = [ "github.com/Malwarebytes" ];
  };

  programs.ssh = {
  };
}
