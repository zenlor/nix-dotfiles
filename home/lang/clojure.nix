{ config
, home-manager
, lib
, pkgs
, ... }:
{
  home.packages = with pkgs; [
    clojure
    clojure-lsp
  ];
}
