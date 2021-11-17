{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "gyro";
  version = "unstable-2021-11-15";

  src = fetchFromGitHub {
    owner = "mattnite";
    repo = pname;
    rev = "54af3ee9d9360f20aeb25f09c1c72ad31b6f6f9f";
    sha256 = "1+YBQ23ngLOks1Vv80SnAmz70x6BN4vIT5Gttqv0eJM=";
    fetchSubmodules = true;
  };

  options = [
    "-Drelease-safe"
    "-Dcpu=baseline"
  ];

  meta = with lib; {
    homepage = "https://github.com/mattnite/gyro";
    description = "A Zig package manager with an index, build runner, and build dependencies";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ joachimschmidt557 ];
  };
}
