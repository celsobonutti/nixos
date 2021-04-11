{
  services.stalonetray = {
    enable = true;
    config = {
      decorations = "none";
      transparent = false;
      dockapp_mode = "none";
      geometry = "5x1-400+0";
      kludges = "force_icons_size";
      grow_gravity = "NE";
      icon_gravity = "NE";
      icon_size = 16;
      sticky = true;
      window_type = "dock";
      background="#000000";
      window_layer = "bottom";
      no_shrink = true; 
      skip_taskbar = true;
      window_strut = "bottom";
    };
  };
}
