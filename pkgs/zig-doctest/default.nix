{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "zig-doctest-unstable";
  version = "2022-07-28";

  src = fetchFromGitHub {
    owner = "kristoff-it";
    repo = "zig-doctest";
    rev = "809e8625892935a1e09712f5e2bb98881ee1038b";
    sha256 = "Vf2fzCwxeIJaVjABk18t0GC+NV7S2u1qexm4hIyP8xE=";
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
