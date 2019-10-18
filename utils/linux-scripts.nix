{ stdenv, fetchFromGitHub, haskellPackages
, pywal, betterlockscreen }:

let
  description = "Personal Linux-specific scripts/utilities";
in stdenv.mkDerivation rec {
  name = "linux-scripts-${version}";
  version = "e205a86ada9b6c3c83f97baf6f5dcd14bd08fe74";

  src = fetchFromGitHub {
    owner = "emmanuelrosa";
    repo = "linux-scripts";
    rev = version;
    sha256 = "1d081vivcic86yvbq2c0j5cqkmi9sp9kkckyf51h2aslfxnh6l71";
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
