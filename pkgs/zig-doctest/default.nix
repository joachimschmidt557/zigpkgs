{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "zig-doctest";
  version = "unstable-2021-09-30";

  src = fetchFromGitHub {
    owner = "kristoff-it";
    repo = pname;
    rev = "c0c60b29c48c22bc3580884f96ebf6db0a3a7f47";
    sha256 = "OFFqVu67b81+m969XSegP5NVdZc0TA0vybdHrh5DbEU=";
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
