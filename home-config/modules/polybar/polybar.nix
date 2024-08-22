{pkgs, config, ...}:

{
  services.polybar = {
    enable = true;
    package = pkgs.polybarFull;
    script = ''
      polybar -c ./config.ini &
    '';
  };
}
