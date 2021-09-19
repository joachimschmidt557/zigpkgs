{ lib, stdenv, zig }:

{ buildFile ? "build.zig"
, steps ? [ "install" ]
  # , zigLibDir ? "${zig}/lib/zig" # 0.8.1 doesn't support this
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
      --build-file ${buildFile} \
      ${lib.concatStringsSep " " options} \
      --prefix $out \
      ${lib.concatStringsSep " " steps}
    runHook postInstall
  '';
})
