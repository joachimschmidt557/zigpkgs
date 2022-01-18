{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
}:

buildZigProject rec {
  pname = "bork";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "kristoff-it";
    repo = "bork";
    rev = "bcaed8091b6a6452ea4276d11f5e65fc4e01c12a";
    sha256 = "FlZ8jp0NgFWtAGTayFYWJ+s0bLFrNDB1t8OZOLl0jD0=";
  };

  options = [
    "-Drelease-safe"
    "-Dcpu=baseline"
  ];

  meta = with lib; {
    homepage = "https://github.com/kristoff-it/bork";
    description = "A TUI chat client tailored for livecoding on Twitch.";
    license = licenses.mit;
    platforms = platforms.linux ++ platforms.darwin;
    maintainers = with maintainers; [ joachimschmidt557 ];
  };
}
