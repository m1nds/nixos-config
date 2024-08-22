{pkgs, config, ...}:

{
  home.file."./.config/polybar/example/" = {
    source = ./config.ini;
  };

  services.polybar = {
    enable = true;
    package = pkgs.polybarFull;
    script = ''
      polybar -c ~/.config/polybar/example &
    '';
  };
}
