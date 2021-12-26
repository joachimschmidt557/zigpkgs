{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "zls";
  version = "unstable-2021-12-23";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = pname;
    rev = "18569926a36d6fcd107252b023990250b44382c3";
    sha256 = "FEOZYTA1jU1ddRLNLLgUp7UvbwmqN5dRn773iD8JCLY=";
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
