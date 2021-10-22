{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "zls";
  version = "unstable-2021-10-19";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = pname;
    rev = "088dc570de3870ababd35a94ac67b0f60c61361b";
    sha256 = "DNy1/uGvq12HAUwy++ckXNgtvmrMU3cwDEA96z6hhfE=";
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
