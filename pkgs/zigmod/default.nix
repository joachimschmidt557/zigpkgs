{ lib
, git
, cacert
, stdenv
, fetchFromGitHub
, buildZigProject
}:

let
  src = fetchFromGitHub {
    owner = "nektro";
    repo = "zigmod";
    rev = "88305122a91b853fc753fc05234b7f695e6ebe8c";
    sha256 = "S0od1RV4LybZmRyT9bWU9gMYsn3Qonf6lhCiBceSW0U=";
    fetchSubmodules = true;
  };
  version = "77";
  zigmodBootstrap = import ./bootstrap.nix {
    inherit src version fetchFromGitHub buildZigProject;
  };
  zigmod-deps = stdenv.mkDerivation {
    name = "zigmod-deps";

    inherit src;

    nativeBuildInputs = [ zigmodBootstrap git cacert ];

    buildPhase = ''
      runHook preBuild

      zigmod ci
      find -name .git -print0 | xargs -0 rm -rf

      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p $out
      cp deps.zig $out
      cp -r --reflink=auto .zigmod/deps $out

      runHook postInstall
    '';

    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    outputHash = "UBNTczTpOyI0w36MWPJyiBWE9TVAWj7Ypr4ziPYjDfc=";

    dontFixup = true;
  };
in buildZigProject {
  pname = "zigmod";

  inherit src version;

  preBuild = ''
    mkdir -p .zigmod/deps
    cp ${zigmod-deps}/deps.zig deps.zig
    cp -r --reflink=auto ${zigmod-deps}/deps .zigmod/
  '';

  options = [
    "-Drelease"
    "-Dcpu=baseline"
  ];

  meta = with lib; {
    homepage = "https://github.com/nektro/zigmod";
    description = "A package manager for the Zig programming language";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ joachimschmidt557 ];
  };
}
