{ fetchFromGitHub
, buildZigProject
, src
, version
}:

buildZigProject rec {
  pname = "zigmod-bootstrap";

  inherit src version;

  options = [
    "-Dbootstrap"
    "-Drelease"
    "-Dcpu=baseline"
  ];
}
