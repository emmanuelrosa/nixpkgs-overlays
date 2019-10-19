self: super: 
{
  syncthing = (super.callPackage (import ./syncthing.nix) {}).syncthing;
}
