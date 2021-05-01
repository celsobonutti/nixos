{
  services.stalonetray = {
    enable = true;
    config = {
      decorations = "none";
      transparent = false;
      dockapp_mode = "none";
      geometry = "10x1-0-0";
      grow_gravity = "NE";
      icon_gravity = "NE";
      icon_size = 23;
      sticky = true;
      window_type = "dock";
      background="#000000";
      window_layer = "bottom";
      no_shrink = true; 
      skip_taskbar = true;
      window_strut = "top";
      kludges = "fix_window_pos,force_icons_size";
    };
  };
}
