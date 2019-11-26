let 
  toplevel = {
    fonts = (import ./fonts);
    utils = (import ./utils);
    pkgs = (import ./pkgs);
  };
in
  with toplevel; [
    fonts
    utils
    pkgs
  ]
