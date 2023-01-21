{ lib, stdenv, zig }:

{ buildFile ? "build.zig"
, steps ? [ "install" ]
, zigLibDir ? "${zig}/lib"
, options ? [ "-Dcpu=baseline" ]
, nativeBuildInputs ? [ ]
, ...
}@args:

stdenv.mkDerivation (args // {
  nativeBuildInputs = [ zig ] ++ nativeBuildInputs;

  dontConfigure = true;

  installPhase = ''
    runHook preInstall
    zig build \
      --global-cache-dir $TMPDIR/zig-cache \
      --zig-lib-dir ${zigLibDir} \
      --build-file ${buildFile} \
      ${lib.concatStringsSep " " options} \
      --prefix $out \
      ${lib.concatStringsSep " " steps}
    runHook postInstall
  '';
})
