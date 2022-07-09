{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "zig-doctest-unstable";
  version = "2022-05-13";

  src = fetchFromGitHub {
    owner = "kristoff-it";
    repo = "zig-doctest";
    rev = "f0b6548da724f56a4d2efd7481033f2887349edb";
    sha256 = "Zmg3jaMLrgZdjXqrnjJ6inex+h7p/sfKHTn7XqenLHU=";
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
