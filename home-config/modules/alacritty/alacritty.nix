{config, pkgs, ...}:

let
  colorschemes = import ./colorschemes.nix;
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = colorschemes.OneHalfDark;
      window.opacity = 0.95;

      font.normal.family = "DejaVu Sans Mono";

      window.padding = {
        x = 16;
        y = 16;
      };

      font.offset = {
	x = 0;
        y = 0;
      };
    };
  };
}
