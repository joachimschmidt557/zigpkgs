{ lib
, stdenv
, fetchFromGitHub
, zig
}:

stdenv.mkDerivation rec {
  pname = "vpkz";
  version = "unstable-2021-09-10";

  src = fetchFromGitHub {
    owner = "joachimschmidt557";
    repo = pname;
    rev = "da02a05916e8c6e300f97739c99f7276477912b2";
    sha256 = "gppaifGlHibBxdrpsCNqc17p97OlJ/rQ5Chno9dsGV0=";
  };

  nativeBuildInputs = [ zig ];

  dontConfigure = true;

  preBuild = ''
    export HOME=$TMPDIR
  '';

  installPhase = ''
    runHook preInstall
    zig build -Drelease-safe -Dcpu=baseline --prefix $out install
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/joachimschmidt557/vpkz";
    description = "Zig library and command-line application for working with Valve VPK files";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ joachimschmidt557 ];
  };
}
