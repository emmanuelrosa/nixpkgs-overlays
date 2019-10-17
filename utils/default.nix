self: super: 
{
  linux-scripts = super.callPackage (import ./linux-scripts.nix) {};
}
