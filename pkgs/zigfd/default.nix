{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "zigfd-unstable";
  version = "2022-07-09";

  src = fetchFromGitHub {
    owner = "joachimschmidt557";
    repo = "zigfd";
    rev = "69914975c82a78d12da08f8a6b4d1157f41c1b06";
    sha256 = "NCUNUbhhN637B9yjHmysOT1cRWrWSHty4Yyful19BPw=";
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
