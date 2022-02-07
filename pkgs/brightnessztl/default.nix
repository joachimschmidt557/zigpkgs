{ lib
, fetchFromGitHub
, buildZigProject
, pkg-config
, systemd
, logindSupport ? true
}:

buildZigProject rec {
  pname = "brightnessztl-unstable";
  version = "2022-02-01";

  src = fetchFromGitHub {
    owner = "hspak";
    repo = "brightnessztl";
    rev = "fd7ab31bfe8e06f112061427bb14bf06ccfb5869";
    sha256 = "teri9WYSHNDaHquBwipGKFey8bbpJt4e/e199Q+uUjI=";
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
