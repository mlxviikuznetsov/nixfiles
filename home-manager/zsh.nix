{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    shellAliases = {
      rebuild = "nh os switch";
    };

    oh-my-zsh = {
      enable = true;
      theme = "norm";
      plugins = [ "git" ];
    };
  };
}
