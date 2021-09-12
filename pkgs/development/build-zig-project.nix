{ lib, stdenv, zig }:

{
  step ? "install"
, options ? [ "-Dcpu=baseline" ]
, nativeBuildInputs ? []
, ...
}@args:

stdenv.mkDerivation (args // {
  nativeBuildInputs = [ zig ] ++ nativeBuildInputs;

  dontConfigure = true;

  preBuild = ''
    export HOME=$TMPDIR
  '';

  installPhase = ''
    runHook preInstall
    zig build ${lib.concatStringsSep " " options} --prefix $out ${step}
    runHook postInstall
  '';
})
