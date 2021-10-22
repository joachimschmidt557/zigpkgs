{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "gyro";
  version = "unstable-2021-10-17";

  src = fetchFromGitHub {
    owner = "mattnite";
    repo = pname;
    rev = "4b79a195f9b043e65a8d884245e3c53fb2547a29";
    sha256 = "m9ZZfHpvOs3XFIroJMAVldPXQ7/K6abQkGjBiNvh4Tk=";
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
