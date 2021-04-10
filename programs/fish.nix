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

      source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
    '';
  };
}
