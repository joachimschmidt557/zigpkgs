{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "zig-doctest";
  version = "unstable-2021-10-29";

  src = fetchFromGitHub {
    owner = "kristoff-it";
    repo = pname;
    rev = "db032a30e8241751efaf2d0cbf1d92c6aa101c76";
    sha256 = "JO7iN3+pctBTVWE2y8ytnTo7ddqpJa0GeYqGvMV0gB8=";
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
