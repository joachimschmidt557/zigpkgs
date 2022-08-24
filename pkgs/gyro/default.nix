{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "gyro-unstable";
  version = "2022-08-13";

  src = fetchFromGitHub {
    owner = "mattnite";
    repo = "gyro";
    rev = "1c841a37f137cf24271bd10e9c9e284d848565bf";
    sha256 = "kE+4qZPar1Vgb/GjtxugCAeD42xJMJQlKR9Dvnwjzr0=";
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
