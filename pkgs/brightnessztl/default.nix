{ lib
, fetchFromGitHub
, buildZigProject
, pkg-config
, systemd
, logindSupport ? true
}:

buildZigProject rec {
  pname = "brightnessztl-unstable";
  version = "2023-11-26";

  src = fetchFromGitHub {
    owner = "hspak";
    repo = "brightnessztl";
    rev = "d20672ac818553df804996a3fd6122b4c4f88296";
    hash = "sha256-gOfb3+74JfKUirhsScOMz59FkItU8sS3bM9b8xnvFok=";
  };

  nativeBuildInputs = lib.optional logindSupport pkg-config;

  buildInputs = lib.optional logindSupport systemd;

  options = [
    "-Dcpu=baseline"
    "-Dlogind=${lib.boolToString logindSupport}"
    "-Doptimize=ReleaseSafe"
  ];

  meta = with lib; {
    homepage = "https://github.com/hspak/brightnessztl";
    description = " A CLI to control device backlight";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ joachimschmidt557 ];
  };
}
