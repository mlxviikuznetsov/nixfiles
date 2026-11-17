{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "kirigirisu";
  home.homeDirectory = "/home/kirigirisu";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    btop
    nnn
    ffmpeg
    ripgrep
    wl-clipboard
    xwayland-satellite
    telegram-desktop
    whatsapp-electron
    libreoffice
    musescore
    audacity
    ardour
    qpwgraph
    lsp-plugins
    sonic-visualiser
    surge-xt
    geonkick
    spotify
    foliate
    papers
    loupe
    uv
  ];

  # Import the default niri-flake conifg.
  # imports = [ (import "${inputs.niri}/default-config.kdl.nix" inputs) ];
  imports = [
    ./home-manager/git.nix
    ./home-manager/zsh.nix
    ./home-manager/niri.nix
    ./home-manager/neovim.nix
    ./home-manager/alacritty.nix
    ./home-manager/fastfetch.nix
    ./home-manager/obs-studio.nix
    ./home-manager/direnv.nix
    ./home-manager/tidalcycles.nix
  ];

  # Customize modules here.
  # An example from Home Manager Manual:
  # services.gpg-agent = {
  #   enable = true;
  #   defaultCacheTtl = 1800;
  #   enableSshSupport = true;
  # };
  programs.firefox = {
    enable = true;
    profiles.kirigirisu = {
      id = 0;
      isDefault = true;
    };
  };
  programs.gh.enable = true;
  programs.tmux.enable = true;
  programs.mpv = {
    enable = true;
    config = {
      osc = false;
    };
  };

  services.syncthing.enable = true;

  stylix.targets = {
    firefox.profileNames = [ "kirigirisu" ];
    rofi.enable = false;
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = let
      images = "org.gnome.Loupe.desktop";
      docs = "org.gnome.Papers.desktop";
    in {
      "image/png" = images;
      "image/jpeg" = images;
      "image/gif" = images;
      "image/webp" = images;
      "image/svg+xml" = images;
      "image/avif" = images;
      "image/heif" = images;
      "image/bmp" = images;
      "image/tiff" = images;
  
      "application/pdf" = docs;
      "image/vnd.djvu" = docs;
      "application/postscript" = docs;
      "application/x-cbz" = docs;
      "application/vnd.comicbook+zip" = docs;
    };
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

