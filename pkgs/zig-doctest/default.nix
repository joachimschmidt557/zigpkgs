{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "zig-doctest";
  version = "unstable-2021-12-05";

  src = fetchFromGitHub {
    owner = "kristoff-it";
    repo = pname;
    rev = "964f997fc5170370c4be121b30d08d898498c9c7";
    sha256 = "NZnBamu0QRgW0jV5zXTCTD0fnQz+SpNfAiXEJJOcINM=";
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
