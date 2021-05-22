{ config, pkgs, lib, ... }:
let
  agda = pkgs.agda.withPackages (p: [
    pkgs.agdaPackages.standard-library
  ]);
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
    builtins.elem (lib.getName pkg) [
      "plexmediaserver"
      "ngrok"
      "vscode"
      "code"
    ];

  home.packages = with pkgs; [
    bottom
    fortune
    fish
    ranger
    alacritty
    git
    nodejs-16_x
    haskellPackages.haskell-language-server
    haskellPackages.stack
    haskellPackages.ghc
    haskellPackages.cabal-install
    agda
    xmobar
    exercism
    pavucontrol
    rustup
    rust-analyzer
    cmake
    gcc
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
  ];

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    }))
  ];

  services.emacs = {
    package = pkgs.emacsGit;
    enable = true;
  };

  programs.emacs = {
    enable = true;
    extraPackages = (epkgs: [ epkgs.vterm ]);
  };

  programs.firefox = {
    enable = true;
    profiles = {
      myprofile = {
        settings = { "general.smoothScroll" = false; };
        userChrome = ''
          #contentAreaContextMenu{ margin: 25px }
        '';
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

  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
  };
}
