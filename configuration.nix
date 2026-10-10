# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  # Enable bluetooth.
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };
  
  # Enable all firmware.
  hardware.enableAllFirmware = true;

  # Allow unfree software.
  nixpkgs.config.allowUnfree = true;

  # Enable flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the GRUB EFI boot loader.
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    timeout = 5;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      configurationLimit = 10;
    };
  };

  boot.supportedFilesystems = [ "ntfs" ];
  time.hardwareClockInLocalTime = true;
  services.btrfs.autoScrub.enable = true;

  networking.hostName = "nykr"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # This line below was added by me.
  # networking.enableIPv6 = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."kirigirisu" = {
    isNormalUser = true;
    description = "Maximilian Kuzniatsou";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    git
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  
  # Enable niri.
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;

  # Enable ly.
  services.displayManager.ly = {
    enable = true;
    settings = {
      bigclock = "en";
      clock = "%A, %d %B %Y";
      animation = "matrix";
      hide_borders = false;
    };
  };

  # Enable Nix Helper.
  programs.nh = {
    enable = true;
    flake = "/home/kirigirisu/nixfiles";
  };

  # Enable UPower.
  services.upower.enable = true;

  # Enable XDG Desktop Portals.
  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config.common.default = [ "gtk" "gnome" ];
  };

  # Enable zsh.
  programs.zsh.enable = true;
  users.users.kirigirisu.shell = pkgs.zsh;

  # Enable stylix.
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/framer.yaml";
    fonts = {
      sansSerif = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka Nerd Font";
      };
      serif = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka Nerd Font";
      };
      monospace = {
        package = pkgs.nerd-fonts.iosevka-term;
        name = "IosevkaTerm Nerd Font";
      };
      sizes = {
	applications = 12;
        terminal = 14;
      };
    };
  };

  
  # Install fonts.
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.symbols-only
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
