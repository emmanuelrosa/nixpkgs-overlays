self: super: 
{
  xmobar-git = super.xmobar.overrideAttrs (oldAttrs: rec {
    name = "xmobar-git";

    src = self.fetchFromGitHub {
      owner = "jaor";
      repo = "xmobar";
      rev = "c175588099632c474f988fb4a61ab51ad2523975";
      sha256 = "0z6j9i48ll58wlmvllj5mi9k8p4mgpylnsj9mbilmah1bhs192qi";
    };
  });
}
