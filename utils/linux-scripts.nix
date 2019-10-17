{ stdenv, fetchFromGitHub, haskellPackages
, pywal, betterlockscreen }:

let
  description = "Personal Linux-specific scripts/utilities";
in stdenv.mkDerivation rec {
  name = "linux-scripts-${version}";
  version = "aa2efecc7476c99fde9838ff5044f0a788acca14";

  src = fetchFromGitHub {
    owner = "emmanuelrosa";
    repo = "linux-scripts";
    rev = version;
    sha256 = "1fk0626mbrrzrnjmj1bcnf88wv2ifnwqq3419cvbm1hqpqr30qy0";
  };

  buildInputs = [ 
    (haskellPackages.ghcWithPackages (p: [
      p.turtle
      p.sysinfo
      p.formatting
    ])) 
  ];

  buildPhase = ''
    mkdir ./build

    ghc -cpp \
      -D_ER_PATH_WAL_=\"${pywal}/bin/wal\" \
      -D_ER_PATH_BETTERLOCKSCREEN_=\"${betterlockscreen}/bin/betterlockscreen\" \
      -o ./build/er-wallpaper ./src/er-wallpaper.hs

    ghc -cpp -o ./build/er-i3memory ./src/er-i3memory.hs
    ghc -cpp -o ./build/er-i3swap ./src/er-i3swap.hs
    ghc -cpp -o ./build/er-i3battery ./src/er-i3battery.hs
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -r ./build/* $out/bin
  '';

  meta = with stdenv.lib; {
    inherit description;
    homepage = https://github.com/emmanuelrosa/linux-scripts;
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ emmanuelrosa ];
  };
}
