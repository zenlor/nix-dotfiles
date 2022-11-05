{ config, lib, pkgs, ... }:

{
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    git
  ];

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    brewPrefix = "/opt/homebrew/bin";

    brews = [
      "emacs-plus@29"
      "openjdk@19"
      "saml2aws"
    ];

    casks = [
      "firefox"
      "slack"
      "alacritty"
      "font-iosevka"
      "zoom"
    ];

    taps = [
      "homebrew/cask"
      "homebrew/cask-versions"
      "homebrew/cask-fonts"
      "d12frosted/emacs-plus"
    ];
  };

  #/ environment.etc."path.d" = {
  #/   brew_sbin.source = "/opt/homebrew/sbin";
  #/   brew_bin.source = "/opt/homebrew/bin";
  #/ };
}
