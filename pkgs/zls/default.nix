{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "zls-unstable";
  version = "2022-01-12";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "fefabc658fd0f14eb0f3cf637805ad51efc5f052";
    sha256 = "O4yBj9QsE0MgzimlYQ+3Af2bh7SGWST4XniJ8qXqmpA=";
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
    broken = true;
  };
}
