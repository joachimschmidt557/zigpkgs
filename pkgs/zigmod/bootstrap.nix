{ lib
, stdenv
, fetchFromGitHub
, zig
}:

stdenv.mkDerivation rec {
  pname = "zigmod-bootstrap";
  version = "77";

  src = fetchFromGitHub {
    owner = "nektro";
    repo = pname;
    rev = "88305122a91b853fc753fc05234b7f695e6ebe8c";
    sha256 = "S0od1RV4LybZmRyT9bWU9gMYsn3Qonf6lhCiBceSW0U=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ zig ];

  dontConfigure = true;

  preBuild = ''
    export HOME=$TMPDIR
  '';

  installPhase = ''
    runHook preInstall
    zig build -Dbootstrap -Drelease-safe -Dcpu=baseline --prefix $out install
    runHook postInstall
  '';
}
