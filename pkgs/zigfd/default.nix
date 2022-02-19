{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "zigfd-unstable";
  version = "2022-02-12";

  src = fetchFromGitHub {
    owner = "joachimschmidt557";
    repo = "zigfd";
    rev = "3dcf2bf6ecc4f3051a8a2d863d902ad7f7a384b0";
    sha256 = "+BXLP4Ni9Q2u1ucdMjg+zstbQ1lazpGERw5PlMB9Scw=";
    fetchSubmodules = true;
  };

  options = [
    "-Drelease-safe"
    "-Dcpu=baseline"
  ];

  meta = with lib; {
    homepage = "https://github.com/joachimschmidt557/zigfd";
    description = "Recursively find files and directories with a regex pattern";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ joachimschmidt557 ];
  };
}
