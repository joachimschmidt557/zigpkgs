{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "vpkz-unstable";
  version = "2022-07-11";

  src = fetchFromGitHub {
    owner = "joachimschmidt557";
    repo = "vpkz";
    rev = "cfabceabc05494789860791a449aa5b662fec4c9";
    sha256 = "EHS3mG38YYL9wwzxHxHnTl7D6cuuS6TvOCDWdy5PV3I=";
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
    broken = true;
  };
}
