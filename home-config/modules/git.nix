{ config, pkgs, ...}:

{
  programs.git = {
    enable = true;
    userName = "Lyes BOURENNANI";
    userEmail = "lyes.bourennani@epita.fr"
  };
}
