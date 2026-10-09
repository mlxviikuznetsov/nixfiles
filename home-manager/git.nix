{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Maximilian Kuzniatsou";
      user.email = "maximiliankuzniatsou@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
