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
    rev = "a8cd50a5a6530aec048484d87d0f7f7c3f4bb978";
    sha256 = "197lIq+wlJOWMFM8KZI7w8xTe8mT3F2cvfvxpJ4dKos=";
    fetchSubmodules = true;
  };
  version = "92";
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
    outputHash = "0yypvac8z5b9kcaxl0a52yz5ml37yzdpgalp9j2jz9wggd5741dk";

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
