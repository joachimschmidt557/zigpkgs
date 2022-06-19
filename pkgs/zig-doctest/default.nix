{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "zig-doctest-unstable";
  version = "2022-01-31";

  src = fetchFromGitHub {
    owner = "kristoff-it";
    repo = pname;
    rev = "540b7bc750bd0c84e31b917761257bf7ccce94e6";
    sha256 = "Q51wlU7Pj9a8AHeo3vLibcdqtWSJrTejp13iAltk84E=";
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
    broken = true;
  };
}
