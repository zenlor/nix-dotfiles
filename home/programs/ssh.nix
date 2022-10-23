{ config, lib, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    compression = true;
    controlMaster = "yes";
    controlPersist = "10m";
    forwardAgent = true;
  };
}
