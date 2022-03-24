{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "zls-unstable";
  version = "2022-03-24";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "14698c35c9c948302cf13d1f9ddc4b18317be1f0";
    sha256 = "Kjr//phKIMCZ8dyE8gGD5gGAlg4kJcWVralLcH7iZcg=";
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
