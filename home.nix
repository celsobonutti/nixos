{ config, pkgs, lib, ... }:

let
  agda = pkgs.agda.withPackages (p: [ pkgs.agdaPackages.standard-library ]);

  nixos = import <nixos> {
    overlays = [
      (import (builtins.fetchTarball {
        url =
          "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      }))
    ];
  };

  nixpkgs = import <nixpkgs> {};
in {

  imports = [
    ./programs/git.nix
    ./programs/vim.nix
    ./programs/fish.nix
    ./services/stalonetray.nix
  ];

  home.username = "dokkora";
  home.homeDirectory = "/home/dokkora";
  home.stateVersion = "21.03";

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "plexmediaserver" "ngrok" "firefox-devedition-bin" "firefox" ];

  home.packages = with pkgs;
    [
      bottom
      fortune
      fish
      ranger
      alacritty
      git
      nodejs-16_x
      agda
      xmobar
      exercism
      pavucontrol
      rustup
      rust-analyzer
      elmPackages.elm
      leiningen
      flameshot
      plex
      tdesktop
      playerctl
      stalonetray
      silver-searcher
      fd
      bat
      exa
      xorg.libXScrnSaver
      wget
      ngrok
      fzf
      cargo-watch
      clisp
      transmission-qt
      ripgrep
      nodePackages.prettier
      niv
      zlib
      gimp
      python39
      racket
      brave
      gnumake
      evince
      elixir
      nixfmt
      html-tidy
      pandoc
      mint
      nyxt
      obs-studio
      arandr
      yarn
      zig
      gcc
      cmake
      xorg.xkill
    ] ++ (with pkgs.haskellPackages; [
      haskell-language-server
      stack
      ghc
      cabal-install
      brittany
      hls-brittany-plugin
    ]);

  services.emacs = {
    package = nixos.emacsGcc;
    enable = true;
  };

  programs.emacs = {
    enable = true;
    package = nixos.emacsGcc;
    extraPackages = (epkgs: [ epkgs.vterm ]);
  };

  programs.firefox = {
    enable = true;
    package = nixpkgs.firefox-devedition-bin;
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

  programs.vscode = {
    enable = true;
    package = nixpkgs.vscodium;
  };
}
