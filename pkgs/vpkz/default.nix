{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "vpkz";
  version = "unstable-2021-12-19";

  src = fetchFromGitHub {
    owner = "joachimschmidt557";
    repo = pname;
    rev = "28beca6ba6502fd736f205bc190fdc3265a8f9e4";
    sha256 = "V+1d8MzyZVJD1FclVbFPka8vZ7PYuMAVZTp36cHrvqs=";
  };

  options = [
    "-Drelease-safe"
    "-Dcpu=baseline"
  ];

  meta = with lib; {
    homepage = "https://github.com/joachimschmidt557/vpkz";
    description = "Zig library and command-line application for working with Valve VPK files";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ joachimschmidt557 ];
  };
}
