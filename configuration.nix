# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [
    "nix-command" "flakes"
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Enable networking tools (NM, WG for vpn, ...)
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    wireguard.enable = true;
    firewall = {
      enable = false;
      extraCommands = ''iptables -A INPUT -i tun0 -j DROP'';
    };
    extraHosts = 
    ''
    192.168.1.100 homelab.home
    192.168.1.100 longhorn.homelab.home
    192.168.1.100 vault.homelab.home
    192.168.1.100 cloud.homelab.home
    '';
  };

  # Configure hardware options.
  hardware = {
    #pulseaudio.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };

  # Services configurations
  services = {
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      xkb = {
        layout = "fr";
	variant = "azerty";
      };
    };
    
    displayManager = {
      defaultSession = "none+i3" ;
    };

    picom = {
      enable = true;
    };

  };

  # Configure console keymap
  console.keyMap = "fr";

  # Virtualisation configuration.
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
    virtualbox.host.enable = true;
  };

  users = {
    defaultUserShell = pkgs.zsh;
    extraGroups.vboxusers.members = [ "m1nds" ];
    users.m1nds = {
      isNormalUser = true;
      description = "m1nds";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
      packages = with pkgs; [discord];
    };
  };

  #users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  programs = {
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
  	pkgsi686Linux.glibc
      ];
    };

    ssh = {
      startAgent = true;
    };

    zsh.enable = true;
    virt-manager.enable = true;

    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  fonts = {
    enableDefaultPackages = true;
    enableGhostscriptFonts = true;

    packages = with pkgs; [
      font-awesome
      corefonts
      (nerdfonts.override { fonts = [ "DejaVuSansMono" ]; })

    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "DejaVu Sans Mono" ];
        sansSerif = [ "DejaVu Sans Mono" ];
        monospace = [ "DejaVu Sans Mono" ];
      };
    };
  };
  
  # System packages.
  environment.systemPackages = with pkgs; [
     home-manager
     vim
     wget
     git
  ];
  
  # Enable documentation.
  documentation.dev.enable = true;
  
  # Environment Variables.
  environment.variables = {
    BROWSER = "firefox";
    SHELL = "zsh";
    TERMINAL = "alacritty";
    EDITOR = "vim";
  };
  
  security.rtkit.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
