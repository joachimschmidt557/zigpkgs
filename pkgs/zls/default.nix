{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "zls-unstable";
  version = "2022-03-01";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "4e6564d7daec95b4fb51cadfe25973a87cac181a";
    sha256 = "LEVBw4uYLrGpvNTwbUQdrVNViy5F9tWu8aTVupvA/bc=";
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
