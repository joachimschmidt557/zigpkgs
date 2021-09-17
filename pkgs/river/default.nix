{ lib
, stdenv
, fetchFromGitHub
, buildZigProject
, wayland
, pkg-config
, scdoc
, xwayland
, wayland-protocols
, wlroots
, libxkbcommon
, pixman
, udev
, libevdev
, libinput
, libX11
, libGL
}:

buildZigProject rec {
  pname = "river";
  version = "unstable-2021-09-16";

  src = fetchFromGitHub {
    owner = "ifreund";
    repo = pname;
    rev = "ab55ab8fc2a7f795ec586ad829d040a9820a4486";
    sha256 = "mKPeH5KoKAqbmmvjsTTpOBHpSqlU+LF24iswt5S9Rag=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ wayland xwayland scdoc pkg-config ];

  buildInputs = [
    wayland-protocols
    wlroots
    pixman
    libxkbcommon
    pixman
    udev
    libevdev
    libinput
    libX11
    libGL
  ];

  options = [
    "-Drelease-safe"
    "-Dcpu=baseline"
    "-Dxwayland"
    "-Dman-pages"
  ];

  /*
    Builder patch install dir into river to get default config
    When installFlags is removed, river becomes half broken.
    See https://github.com/ifreund/river/blob/7ffa2f4b9e7abf7d152134f555373c2b63ccfc1d/river/main.zig#L56
  */
  installFlags = [ "DESTDIR=$(out)" ];

  meta = with lib; {
    homepage = "https://github.com/ifreund/river";
    description = "A dynamic tiling wayland compositor";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    maintainers = with maintainers; [ fortuneteller2k ];
  };
}
