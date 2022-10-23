{ config, lib, pkgs, ... }:

{
  homebrew = {
    enable = true;
    autoUpdate = true;
    cleanup = "zap";
    brewPrefix = "/opt/homebrew/bin";

    brews = [];

    casks = [
      "firefox"
      "slack"
      "zoom"
    ];

    taps = [
      "homebrew/cask"
      "homebrew/cask-versions"
    ];
  };
}
