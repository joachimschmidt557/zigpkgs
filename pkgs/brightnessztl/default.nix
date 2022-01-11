{ lib
, fetchFromGitHub
, buildZigProject
, pkg-config
, systemd
, logindSupport ? true
}:

buildZigProject rec {
  pname = "brightnessztl-unstable";
  version = "2021-12-26";

  src = fetchFromGitHub {
    owner = "hspak";
    repo = "brightnessztl";
    rev = "68ed8a49f83110a59aef4c8c4ca57b716685c6a5";
    sha256 = "A9wPGY60qS5vFZ1KPK2EWTYiBDQY/KlELD12CLOP8ks=";
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
