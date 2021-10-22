{ lib
, fetchFromGitHub
, buildZigProject
, pkg-config
, systemd
, logindSupport ? true
}:

buildZigProject rec {
  pname = "brightnessztl";
  version = "0.4";

  src = fetchFromGitHub {
    owner = "hspak";
    repo = "brightnessztl";
    rev = "3b89f16930bc13431a7ec612a52dd63cbeaa6b37";
    sha256 = "TaArxguvX+nCIpRhj/AhkG11+siOYOrB0rzcdLa8qvc=";
  };

  nativeBuildInputs = lib.optional logindSupport pkg-config;

  buildInputs = lib.optional logindSupport systemd;

  # TODO -Dcpu=baseline
  options = [
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
