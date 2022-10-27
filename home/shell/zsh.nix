{ config
, lib
, pkgs
, ... }:
{
  programs.zsh = {
    enable = true;

    dotDir = ".config/zsh";
    history.path = "${config.xdg.dataHome}/zsh/zsh_history";

    autocd = true;
    enableVteIntegration = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    historySubstringSearch.enable = true;
    history.share = true;

    shellAliases = {
      d   = "direnv";
      g   = "git";
      jc  = "journalctl";
      la  = "exa -lah";
      l   = "exa -lh";
      ll  = "exa -lh";
      ls  = "exa";
      md  = "mkdir -p";
      n   = "nix";
      rd  = "rmdir";
      sc  = "systemctl";
      "_" = "sudo ";
    };

    shellGlobalAliases = {
      "..."   = "../..";
      "...."  = "../../..";
      "....." = "../../../...";
    };

    profileExtra = ''
      [ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ] && source $HOME/.nix-profile/etc/profile.d/nix.sh	
    '';

    initExtra = ''
      if [ "$TMUX" = "" ]; then
          tmux attach || tmux
      fi

      export GPG_TTY=$(tty)

      autopair-init

      e()     { pgrep emacs && emacsclient -n "$@" || emacs -nw "$@" }
      ediff() { emacs -nw --eval "(ediff-files \"$1\" \"$2\")"; }
      eman()  { emacs -nw --eval "(switch-to-buffer (man \"$1\"))"; }
      ekill() { emacsclient --eval '(kill-emacs)'; }

      ######################################### oh-my-zsh/lib/key-bindings.zsh #########################################
      # Start typing + [Up-Arrow] - fuzzy find history forward
      if [[ "''${terminfo[kcuu1]}" != "" ]]; then
        autoload -U up-line-or-beginning-search
        zle -N up-line-or-beginning-search
        bindkey "''${terminfo[kcuu1]}" up-line-or-beginning-search
      fi
      # Start typing + [Down-Arrow] - fuzzy find history backward
      if [[ "''${terminfo[kcud1]}" != "" ]]; then
        autoload -U down-line-or-beginning-search
        zle -N down-line-or-beginning-search
        bindkey "''${terminfo[kcud1]}" down-line-or-beginning-search
      fi
      bindkey '^[[127;5u' backward-kill-word                  # [Ctrl-Backspace] - delete whole backward-wordf3
      bindkey '^[[127;2u' backward-kill-word                  # [Shift-Backspace] - delete whole backward-word
      bindkey '^[[127;4u' backward-kill-line                  # [Shift-Alt-Backspace] - delete line up to cursor
      bindkey '^[[3;5~' kill-word                             # [Ctrl-Delete] - delete whole forward-word
      bindkey '^[[3;2~' kill-word                             # [Shift-Delete] - delete whole forward-word
      bindkey '^[[3;4~' kill-line                             # [Shift-Alt-Delete] - delete line from cursor
      bindkey '^[[Z' reverse-menu-complete                    # [Shift-Tab] - move through the completion menu backwards
      bindkey '^[[1;5C' forward-word                          # [Ctrl-RightArrow] - move forward one word
      bindkey '^[[1;5D' backward-word                         # [Ctrl-LeftArrow] - move backward one word
      ##################################################################################################################
    '';

    localVariables = {
      PROMPT_LEAN_TMUX = "™ ";
      CLICOLOR = "1";
      EDITOR = "vim";
    };

    plugins = with pkgs; [
      {
        name = "sfz.prompt.zsh";
        src = fetchFromGitHub {
          owner  = "zenlor";
          repo   = "sfz-prompt.zsh";
          rev    = "f3ff3f6";
          sha256 = "sha256-mArZp+2tHvSsVZXpFWSSah5X3mvNTebKvcox6tQ2nkQ=";
        };
      }
      {
        name = "F-Sy-H";
        src = fetchFromGitHub {
          owner  = "z-shell";
          repo   = "F-Sy-H";
          rev    = "b935a87a75560f8173dd78deee6717c59d464e06";
          sha256 = "sha256-448OlDnrDkUjvaSLDhXsa9bkgYXzj1Ju8CTpJVjH8LM=";
        };
      }
      {
        name = "H-S-MW";
        src = fetchFromGitHub {
          owner  = "z-shell";
          repo   = "H-S-MW";
          rev    = "de9f239bbf360b00efc1ca36211d16390c63cf50";
          sha256 = "sha256-tc6INYnpHxXEIH6oF70KQkxLblnvXoq9EAp4Ys92s90=";
        };
      }
      {
        name = "zsh-autopair";
        src = fetchFromGitHub {
          owner = "hlissner";
          repo = "zsh-autopair";
          rev = "396c38a7468458ba29011f2ad4112e4fd35f78e6";
          sha256 = "sha256-PXHxPxFeoYXYMOC29YQKDdMnqTO0toyA7eJTSCV6PGE=";
        };
        file = "autopair.zsh";
      }
    ];
  };
}
