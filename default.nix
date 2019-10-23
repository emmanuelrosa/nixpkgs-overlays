let 
  toplevel = {
    fonts = (import ./fonts);
    utils = (import ./utils);
  };
in
  with toplevel; [
    fonts
    utils
  ]
