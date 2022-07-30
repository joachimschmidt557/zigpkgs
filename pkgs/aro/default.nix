{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "aro-unstable";
  version = "2022-07-09";

  src = fetchFromGitHub {
    owner = "Vexu";
    repo = "arocc";
    rev = "23133aed979e69148b487138e2638e7f76ded3c4";
    sha256 = "maACbGWEzC/b90/TQ7PTXaH6+e/iXdFlpME7GCSxAp0=";
  };

  options = [
    "-Drelease-safe"
    "-Dcpu=baseline"
  ];

  postInstall = ''
    mv include/ $out
  '';

  meta = with lib; {
    homepage = "https://github.com/Vexu/arocc";
    description = "A C compiler written in Zig.";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ joachimschmidt557 ];
    broken = true;
  };
}
