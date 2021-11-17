{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "zls";
  version = "unstable-2021-11-04";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = pname;
    rev = "12cda9b0310605d170b932ebb6005e44e41f4ee1";
    sha256 = "/HM0D8QQaDVUzT9qMVacDkKV43X4yVVORThkmrYL2pQ=";
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
