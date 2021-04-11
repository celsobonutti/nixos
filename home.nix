{ config, pkgs, ... }:

{
  imports = [
    ./programs/git.nix
    ./programs/vim.nix
    ./programs/fish.nix
    ./programs/kitty.nix
    ./services/stalonetray.nix
  ];

  home.username = "dokkora";
  home.homeDirectory = "/home/dokkora";
  home.stateVersion = "21.03";

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-3.1.13"
  ];

  home.packages = with pkgs; [
    htop
    fortune
    fish
    ranger
    arandr
    kitty
    iosevka
    nodejs
    git
    haskellPackages.haskell-language-server
    haskellPackages.ghc
    haskellPackages.stack
    xmobar
    exercism
    pavucontrol
    rustup
    rust-analyzer
    cmake
    gcc
    elmPackages.elm
    obinskit
    vscode
    leiningen
    flameshot
    plex
    tdesktop
    playerctl
    stalonetray
    evince
  ];

  programs.firefox = {
    enable = true;
    profiles = {
      myprofile = {
        settings = {
          "general.smoothScroll" = false;
        };
      };
    };
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
