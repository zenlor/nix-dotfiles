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
      ".lsp"
      ".clj-kondo"
    ];

    aliases = {
      co = "checkout";
      st = "status";
    };

    extraConfig = {
      core.autocrlf = "input";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.default = "upstream";
      push.autoSetupRemote = true;
      rebase.autosquash = true;
      rerere.enabled = true;

      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed-signers";

      help.autocorrect = 50;
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
