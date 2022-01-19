{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "aro-unstable";
  version = "2022-01-18";

  src = fetchFromGitHub {
    owner = "Vexu";
    repo = "arocc";
    rev = "6b5184a77c10ab3888f76f79fe5653140987d02a";
    sha256 = "wKR002fPQAL1hPRHdflPPnUUms/LopOLN5TQ0+zymDw=";
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
  };
}
