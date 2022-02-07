{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "zls-unstable";
  version = "2022-02-03";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "f3aabd6b7ca424b6aa1be9ef8a215a842301b994";
    sha256 = "y3qu91itvO4AeZTDQooKt5QGS2czpFhDR8A6w2BEXdM=";
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
