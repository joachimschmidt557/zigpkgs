{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "gyro";
  version = "unstable-2022-01-01";

  src = fetchFromGitHub {
    owner = "mattnite";
    repo = "gyro";
    rev = "7f373bb826ba218be283379a8e3a6f3646b93489";
    sha256 = "3CQBCBxzMF35Ave7jjS4+OkdrV/sD2+E+cpybv8xC/M=";
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
