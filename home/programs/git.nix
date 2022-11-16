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

    extraConfig = {
      core.autocrlf = "input";
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autosquash = true;
      rerere.enabled = true;

      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed-signers";
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
