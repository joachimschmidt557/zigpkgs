{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "zls-unstable";
  version = "2022-06-09";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "fc5b1c64579e0ec33ea374051bcfef59ebfc0c5c";
    sha256 = "BM2z+YyYjPHVXXAF6rVks6roirg0ixWWlyatOqxPylE=";
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
