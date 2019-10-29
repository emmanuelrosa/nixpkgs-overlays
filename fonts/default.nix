self: super: 
{
  wingdings = super.callPackage (import ./wingdings.nix) {};
  century-gothic = super.callPackage (import ./century-gothic.nix) {};
}
