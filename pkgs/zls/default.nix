{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "zls";
  version = "unstable-2021-09-10";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = pname;
    rev = "c5414796a49dd5115a3ec398ed6ce6363ac6a8c8";
    sha256 = "414u3Mpy+fyTYmJbbiGd+38SgsEN7bRimXN+D7OB0Ig=";
    fetchSubmodules = true;
  };

  options = [
    "-Drelease-safe"
    "-Dcpu=baseline"
  ];

  meta = with lib; {
    homepage = "https://github.com/zigtools/zls";
    description = "Zig LSP implementation + Zig Language Server";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ joachimschmidt557 ];
  };
}
