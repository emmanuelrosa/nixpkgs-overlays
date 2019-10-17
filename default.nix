let 
  toplevel = {
    fonts = (import ./fonts);
  };
in
  with toplevel; [
    fonts
  ]
