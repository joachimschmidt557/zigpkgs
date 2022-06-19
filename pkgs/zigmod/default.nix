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
    rev = "62469b8511886314757bd7b25b70e3580966ee01";
    sha256 = "NFcFQgzxB5Gm3XweKxBv+pQqKt406YJnu/oTXoVyj6E=";
    fetchSubmodules = true;
  };
  version = "80";
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
    outputHash = "1mljl5icrcmdb8idlxyjvxbjy4h3lxrzf0ir1z4wywag44zdxyib";

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
