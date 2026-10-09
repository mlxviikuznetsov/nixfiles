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
  imports = [
    ./home-manager/git.nix
    ./home-manager/niri.nix
    ./home-manager/neovim.nix
    ./home-manager/obs-studio.nix
  ];

  # Customize modules here.
  # An example from Home Manager Manual:
  # services.gpg-agent = {
  #   enable = true;
  #   defaultCacheTtl = 1800;
  #   enableSshSupport = true;
  # };
  programs.alacritty.enable = true;
  programs.waybar.enable = true;
  programs.firefox.enable = true;
  services.mako.enable = true;
  programs.fuzzel.enable = true;

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

