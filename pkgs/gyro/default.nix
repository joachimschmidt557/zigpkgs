{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "gyro-unstable";
  version = "2022-02-03";

  src = fetchFromGitHub {
    owner = "mattnite";
    repo = "gyro";
    rev = "b3aa10462ccf073701023d74221e388d33b70820";
    sha256 = "S0M2NwELnjBLqTlnJDfXGmzDv3KoswnxXF0j/HaISh4=";
    fetchSubmodules = true;
  };

  options = [
    "-Drelease-safe"
    # FIXME glibc builds don't work right now, use musl instead. The
    # issue is tracked here:
    # https://github.com/ziglang/zig/issues/9485
    "-Dtarget=native-native-musl"
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
