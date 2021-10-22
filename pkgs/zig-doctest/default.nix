{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "zig-doctest";
  version = "unstable-2021-10-12";

  src = fetchFromGitHub {
    owner = "kristoff-it";
    repo = pname;
    rev = "17c230224af13abc8e622435ab1348e270855551";
    sha256 = "8IXPovnCbcJBV+JVJPPphuZG0rwusuFk46W/hJ1OXEk=";
  };

  options = [
    "-Drelease-safe"
    "-Dcpu=baseline"
  ];

  meta = with lib; {
    homepage = "https://github.com/kristoff-it/zig-doctest";
    description = "A tool for testing snippets of code";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ joachimschmidt557 ];
  };
}
