{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "gyro";
  version = "unstable-2021-09-16";

  src = fetchFromGitHub {
    owner = "mattnite";
    repo = pname;
    rev = "fa0a54b5e99adf9d7420fd3d4eaed9fa5ae686b6";
    sha256 = "Sb56kZbXdUPh3FPPyZd7Lwsb7wZczXJMI88lWGgPkVs=";
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
