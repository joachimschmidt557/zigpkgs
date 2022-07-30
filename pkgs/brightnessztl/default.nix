{ lib
, fetchFromGitHub
, buildZigProject
, pkg-config
, systemd
, logindSupport ? true
}:

buildZigProject rec {
  pname = "brightnessztl-unstable";
  version = "2022-02-17";

  src = fetchFromGitHub {
    owner = "hspak";
    repo = "brightnessztl";
    rev = "37ba094993176177de0b17e868c430afcd4dc940";
    sha256 = "Zm76FUORCfgHQUDpEZ7Q0PLV1GoRu03Uj72EWEruALU=";
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
    broken = true;
  };
}
