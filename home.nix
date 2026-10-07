{ config, pkgs, ... }:

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

