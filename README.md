# NixOS-Config
My NixOS configuration which contains scripts to easily deploy it on a new system.
Most of the configuration only uses Nix wrappers.
It currently has these tools configured:

- i3
- alacritty
- zsh
- polybar
- git
 
## How to deploy ?
I created shell scripts that runs the commands to switch the system and home-manager configurations :

```bash
[m1nds@nixos ~]$ git clone https://github.com/m1nds/nixos-config
[m1nds@nixos ~]$ cd nixos-config
[m1nds@nixos ~/nixos-config]$ ./setup-system.sh
[m1nds@nixos ~/nixos-config]$ ./setup-home.sh
```

## References

While making this configuration, I used some part of other repositories:
- [OverMighty's dotfiles](https://github.com/overmighty/dotfiles)
- [Dettorer's NixOS configuration](https://github.com/Dettorer/NixOS-infra)
