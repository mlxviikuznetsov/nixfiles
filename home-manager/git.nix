{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    ignores = [ ".direnv" ];
    settings = {
      user.name = "Maximilian Kuzniatsou";
      user.email = "maximiliankuzniatsou@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
