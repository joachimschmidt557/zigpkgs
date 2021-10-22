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
    rev = "6abac9b3f41b9e3490023d232a57548a71183c9c";
    sha256 = "X0sXER+5BpHhqoQ/5xLB51eS2IOCMvwC9c+9z4D9BQA=";
    fetchSubmodules = true;
  };
  version = "81";
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
    broken = true;
  };
}
