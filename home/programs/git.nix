{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    delta = {
      enable = true;
      options = {
        syntax-theme = "Nord";
        line-numbers = true;
      };
    };
    ignores = [
      ".dir-locals.el"
      ".envrc"
      ".DS_Store"
    ];

    aliases = {
      co = "checkout";
      st = "status";
    };

    signing = {
      signByDefault = true;
    };

    extraConfig = {
      core.autocrlf = "input";
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autosquash = true;
      rerere.enabled = true;

      gpg.format = "ssh";
    };
  };

  programs.gh = {
    enable = true;
    enableGitCredentialHelper = true;
    extensions = [
      pkgs.gh-eco
    ];
  };
}
