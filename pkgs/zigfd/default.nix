{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "zigfd";
  version = "unstable-2021-10-25";

  src = fetchFromGitHub {
    owner = "joachimschmidt557";
    repo = pname;
    rev = "d396f9325ae5c6f66d95d62d56bd38a26cb80ebe";
    sha256 = "Sz+FThBzzRk97ZsZNZBtGwf8D8nI3oijKMdqN4NE/RI=";
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
