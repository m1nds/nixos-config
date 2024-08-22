{config, pkgs, ...}:

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = {
      modifier = "Mod4";

      gaps = {
        inner = 7;
        outer = 7;
        smartBorders = "on";
      };

      bars = [];
    };

    extraConfig = ''
      for_window [class="^."] border pixel 3
      exec --no-startup-id systemctl --user restart polybar
    '';
  };
}
