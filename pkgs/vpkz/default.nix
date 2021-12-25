{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "vpkz";
  version = "unstable-2021-09-20";

  src = fetchFromGitHub {
    owner = "joachimschmidt557";
    repo = pname;
    rev = "7245c9d00d95d87517c364d180520f816f16090e";
    sha256 = "ujt/DTUZvOPs2m/DjfTRpKIDsp9Id4qkPcbEDK95OgU=";
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
