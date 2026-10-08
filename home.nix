{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "kirigirisu";
  home.homeDirectory = "/home/kirigirisu";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    htop
    fortune
    nnn
    wl-clipboard
    telegram-desktop
    spotify
    swaybg
    grim
    slurp
    bluetui
  ];

  # Import the default niri-flake conifg.
  # imports = [ (import "${inputs.niri}/default-config.kdl.nix" inputs) ];

  # Customize modules here.
  # An example from Home Manager Manual:
  # services.gpg-agent = {
  #   enable = true;
  #   defaultCacheTtl = 1800;
  #   enableSshSupport = true;
  # };
  programs.git = {
    enable = true;
    settings = {
      user.name = "Maximilian Kuzniatsou";
      user.email = "maximiliankuzniatsou@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

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

  programs.alacritty.enable = true;
  programs.waybar.enable = true;
  programs.firefox.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  services.mako.enable = true;
  programs.fuzzel.enable = true;
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

