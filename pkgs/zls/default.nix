{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "zls";
  version = "unstable-2021-09-30";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = pname;
    rev = "b63339e35043e7cdd39507f004b0ce99820af976";
    sha256 = "ZsfvncA6akb9xr3qGxmYCDr11duGaWcwMdqpjqxw/Xw=";
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
