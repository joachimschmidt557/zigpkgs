{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject {
  pname = "zigfd";
  version = "unstable-2022-01-02";

  src = fetchFromGitHub {
    owner = "joachimschmidt557";
    repo = "zigfd";
    rev = "2834b335595b6a70bb2f6b0d3cf7a61f86571d1f";
    sha256 = "tHwcJIPU1uf1bOslZbjTObxN1x9xlPqamtdwqNUb47g=";
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
