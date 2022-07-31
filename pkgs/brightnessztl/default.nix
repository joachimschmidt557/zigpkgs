{ lib
, fetchFromGitHub
, buildZigProject
, pkg-config
, systemd
, logindSupport ? true
}:

buildZigProject rec {
  pname = "brightnessztl-unstable";
  version = "2022-07-30";

  src = fetchFromGitHub {
    owner = "hspak";
    repo = "brightnessztl";
    rev = "6d9730e5578a6b082a9507a425eb57847da88cae";
    sha256 = "AZS9Ltfkipjwu37TaO0tyY4Xewg2YPP1Yi96SOS1gC0=";
  };

  nativeBuildInputs = lib.optional logindSupport pkg-config;

  buildInputs = lib.optional logindSupport systemd;

  options = [
    "-Dcpu=baseline"
    "-Dlogind=${lib.boolToString logindSupport}"
    "-Drelease-safe"
  ];

  meta = with lib; {
    homepage = "https://github.com/hspak/brightnessztl";
    description = " A CLI to control device backlight";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ joachimschmidt557 ];
  };
}
