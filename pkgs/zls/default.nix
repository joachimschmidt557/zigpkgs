{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "zls-unstable";
  version = "2023-01-20";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "1ed8d49b305a4ed03578eb251b18e5bd193ec04c";
    sha256 = "MxTgzQE1UI2Bc1mSQGP/mxErqp7e0QU3lerp3KlCNJ0=";
    fetchSubmodules = true;
  };

  options = [
    "-Drelease-safe"
    "-Dcpu=baseline"
  ];

  meta = with lib; {
    homepage = "https://github.com/zigtools/zls";
    description = "The officially unofficial Zig language server";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ joachimschmidt557 ];
  };
}
