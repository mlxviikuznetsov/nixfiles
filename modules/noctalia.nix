{ pkgs, inputs, ... }:

{
  home-manager.users.kirigirisu = {
    # Import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
      settings = {
        # Configure options
	shell.font = "Iosevka Nerd Font";
	wallpaper = {
	  enabled = true;
          directory = "/home/kirigirisu/nixfiles/wallpapers/";
          fill_mode = "crop";

          default = {
            path = "/home/kirigirisu/nixfiles/wallpapers/nixos.png";
          };
	};
      };
    };
  };
}
