{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_small";
        padding.right = 2;
      };
      display.separator = "  ";
      modules = [
        "os"
        "kernel"
        "shell"
        "wm"
        "uptime"
        "memory"
	"disk"
      ];
    };
  };
}
