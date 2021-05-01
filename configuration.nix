# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;

  networking.hostName = "dokkora"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "America/Bahia";

  networking.useDHCP = false;
  networking.interfaces.enp27s0.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";
  
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
  ];

  services.plex = {
    enable = true;
    openFirewall = true;
  };

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "altgr-intl";
    videoDrivers = [ "nvidia" ];
    xkbOptions = "caps:escape";

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmonad 
      ];
    };

    displayManager.defaultSession = "none+xmonad";
  };

  console.useXkbConfig = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;

  users.users.dokkora = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true; 
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

  programs.steam.enable = true;

  services.emacs.package = pkgs.emacsGcc;

    nixpkgs.overlays = [
          (import (builtins.fetchTarball {
                  url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
          }))
  ];

  nix.trustedUsers = [ "root" "dokkora" ];
}
