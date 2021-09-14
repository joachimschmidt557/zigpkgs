{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "zig-doctest";
  version = "unstable-2021-09-02";

  src = fetchFromGitHub {
    owner = "kristoff";
    repo = pname;
    rev = "e1e08298bf7b08b590ea8860ca2415d3e41b7d68";
    sha256 = "D64XvYt3teS2Vi2ijIoDFYQjsDWRZZUM0Mir2+SyU5Y=";
  };

  options = [
    "-Drelease-safe"
    "-Dcpu=baseline"
  ];

  meta = with lib; {
    homepage = "https://github.com/kristoff-it/zig-doctest";
    description = "A tool for testing snippets of code";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ joachimschmidt557 ];
  };
}
