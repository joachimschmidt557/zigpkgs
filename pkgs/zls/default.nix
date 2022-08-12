{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "zls-unstable";
  version = "2022-08-11";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "c632a7f29d67607c3c846a01d211a09c1f64d47c";
    sha256 = "nE2zE2/WI8LQNB4030vu5YPEIgtJS198aD6dfreqnPs=";
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
