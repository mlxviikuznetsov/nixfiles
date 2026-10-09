{ config, pkgs, ... }:

{
  programs.niri.settings = {
    prefer-no-csd = true;
    layout.background-color = "transparent";
    overview.workspace-shadow.enable = false;
  
    input.keyboard.xkb = {
      layout = "us,ru";
      options = "grp:caps_toggle";
    };
  
    spawn-at-startup = [
      { command = [ "waybar" ]; }
      # Set the wallpaper.
      # { command = [ "swaybg" "-i" "/home/kirigirisu/nixfiles/wallpaper.png" "-m" "fill" ]; }
    ];

    # Place wallpaper in the background.
    # layer-rules = [
    #   {
    #     matches = [ { namespace = "^wallpaper$"; } ];
    #     place-within-backdrop = true;
    #   }
    # ];
  
    binds = {
      # Programs
      "Mod+T".action.spawn = "alacritty";
      "Mod+D".action.spawn = "fuzzel";
      "Mod+Shift+Slash".action.show-hotkey-overlay = [];
  
      # Windows
      "Mod+Q".action.close-window = [];
      "Mod+F".action.maximize-column = [];
      "Mod+Shift+F".action.fullscreen-window = [];
      "Mod+R".action.switch-preset-column-width = [];
  
      # Focus
      "Mod+Left".action.focus-column-left = [];
      "Mod+Right".action.focus-column-right = [];
      "Mod+Up".action.focus-window-up = [];
      "Mod+Down".action.focus-window-down = [];
      "Mod+H".action.focus-column-left = [];
      "Mod+L".action.focus-column-right = [];
      # "Mod+K".action.focus-window-up = [];
      # "Mod+J".action.focus-window-down = [];
  
      # Move
      "Mod+Ctrl+Left".action.move-column-left = [];
      "Mod+Ctrl+Right".action.move-column-right = [];
      "Mod+Ctrl+H".action.move-column-left = [];
      "Mod+Ctrl+L".action.move-column-right = [];
  
      # Workspaces
      "Mod+J".action.focus-window-or-workspace-down = [];
      "Mod+K".action.focus-window-or-workspace-up= [];
      "Mod+Ctrl+J".action.move-window-down-or-to-workspace-down = [];
      "Mod+Ctrl+K".action.move-window-up-or-to-workspace-up = [];

      # Overview
      "Mod+O".action.toggle-overview = [];
  
      # Screenshots
      "Print".action.screenshot = [];
  
      # Session
      "Mod+Shift+E".action.quit = [];
    };
  };
}
