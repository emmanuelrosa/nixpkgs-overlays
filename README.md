# nixpkgs-overlays
My personal nixpkgs overlays

## Usage

1. `git clone` this repo.
2. Add the following line to `/etc/nixos/configuration.nix`: `nixpkgs.overlays = import /PATH/TO/nixpkgs-overlays;`
3. Add the desired packages to `environment.systemPackages`; or in the case of fonts to `fonts.fonts`.

The packages defined in the overlays are available in `pkgs` as if they are normal packages.

**NOTE:** The list of overlays is imported directly, hence individual overlays cannot be selected. This is OK, because this overlay is not for public consumption. But rather it's designed to suit *my* needs.


## Example configuration.nix

```
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
    ...
    this-package-is-in-the-overlay-wink-wink
  ];

  nixpkgs.overlays = import /home/emmanuel/projects/nixpkgs-overlays;

  fonts.fonts = with pkgs; [
    ...
    wingdings # this is a real overlay package ;)
  ];

  ...
}
```
