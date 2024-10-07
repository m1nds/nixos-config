{ config, pkgs, ... }:

{
  imports = [
    ./modules/alacritty/alacritty.nix
    ./modules/polybar/polybar.nix
    ./modules/i3.nix
    ./modules/zsh.nix
    ./modules/neovim.nix
    ./modules/virt-manager.nix
  ];

  home.username = "m1nds";
  home.homeDirectory = "/home/m1nds";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    neofetch
    ranger
    alacritty
    file
    bat
    firefox
    zsh
    flameshot
    python3
    nodejs_22
    lua
    rustup
    tree
    keepassxc
    gcc
    gdb
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
     SHELL = "zsh";
     EDITOR = "nvim";
     TERMINAL = "alacritty";
     BROWSER = "firefox";
  };

  programs.home-manager.enable = true;
}
