{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "zls";
  version = "unstable-2022-01-01";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "08f2638d6ad8da576d235ff2b57935fad08d39f1";
    sha256 = "rhUfOhieOIlpXuPbLQMa0CWEjwEFVPjlWo4b57vDoKA=";
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
