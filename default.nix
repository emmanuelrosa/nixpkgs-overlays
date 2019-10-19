let 
  toplevel = {
    fonts = (import ./fonts);
    utils = (import ./utils);
    pr = (import ./pr);
  };
in
  with toplevel; [
    fonts
    utils
    pr
  ]
