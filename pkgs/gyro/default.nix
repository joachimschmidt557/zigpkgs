{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "gyro-unstable";
  version = "2022-01-07";

  src = fetchFromGitHub {
    owner = "mattnite";
    repo = "gyro";
    rev = "5eea2ab9c89ca919b1dba6fbb6791d7a6bf950f7";
    sha256 = "blFfCXnWCPOHLB1LwrNxR9+DyjokgdhCt/fDLWgDCMU=";
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
