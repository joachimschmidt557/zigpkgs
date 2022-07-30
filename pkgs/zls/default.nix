{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "zls-unstable";
  version = "2022-07-15";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "ba68a4dcb50c3cc880fc82e1c9891ee87354a813";
    sha256 = "zfcdPiGku2zDPI0Zcgj6jqLcngDrqjJnnicShJ6K9UI=";
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
