{ config, lib, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    compression = true;
    controlMaster = "yes";
    controlPersist = "10m";
    forwardAgent = true;

    matchBlocks = {
      "frenz.click" = {
        user = "arch";
        host = "frenz.click";
        compression = true;
      };
    };
  };
}
