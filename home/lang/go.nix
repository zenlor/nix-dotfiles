{ config, lib, pkgs, ... }:

{
  programs.go = {
    enable = true;

    goPath = "lib";
    goBin  = "lib/bin";
  };
}
