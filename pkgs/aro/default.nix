{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "aro-unstable";
  version = "2022-08-08";

  src = fetchFromGitHub {
    owner = "Vexu";
    repo = "arocc";
    rev = "ddb00676293aa85b8519ae2aac9dcf2513391471";
    sha256 = "0LrBwXlejgMyFlCwJUjgonvziLIxyRlot8yvt5nMlxI=";
  };

  options = [
    "-Drelease-safe"
    "-Dcpu=baseline"
  ];

  postInstall = ''
    mv include/ $out
  '';

  meta = with lib; {
    homepage = "https://github.com/Vexu/arocc";
    description = "A C compiler written in Zig.";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ joachimschmidt557 ];
    broken = true;
  };
}
