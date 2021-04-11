{
  programs.fish = {
    enable = true;
    shellInit = ''
      set HOME /home/dokkora
      set STACK_ROOT $HOME/.stack_root
      set XDG_DATA_DIRS /usr/share
      set VISUAL vim
      set EDITOR vim

      set PATH $HOME/.local/bin $PATH
      set PATH $HOME/.cargo/bin $PATH
      set PATH $HOME/zls/zig-cache/bin $PATH

      alias hm="home-manager switch"
      alias vhm="vim ~/.config/nixpkgs/home.nix"
      alias vxm="vim ~/.xmonad/xmonad.hs"

      source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
    '';
  };
}
