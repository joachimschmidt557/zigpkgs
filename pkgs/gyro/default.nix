{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "gyro-unstable";
  version = "2022-06-05";

  src = fetchFromGitHub {
    owner = "mattnite";
    repo = "gyro";
    rev = "c8d002b6decad7fa6917b8c9952cdddc2b0f2197";
    sha256 = "qQoBUmbH05y1fVKEagJqG/cBN/jGBIiZAQNW6vgi9tA=";
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
