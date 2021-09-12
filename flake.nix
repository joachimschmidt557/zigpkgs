{
  description = "A collection of Zig packages";

  inputs.zig-overlay.url = "github:arqv/zig-overlay";
  inputs.zig-nightly.url = "github:chivay/zig-nightly";

  outputs = { self, nixpkgs, zig-overlay, zig-nightly }: {

    packages.x86_64-linux =
      let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        buildZigNightlyProject = pkgs.callPackage ./pkgs/development/build-zig-project.nix {
          zig = zig-nightly.defaultPackage."x86_64-linux";
        };
      in
      {

        river = pkgs.callPackage ./pkgs/river { };

        vpkz = pkgs.callPackage ./pkgs/vpkz {
          buildZigProject = buildZigNightlyProject;
        };

        zig-doctest = pkgs.callPackage ./pkgs/zig-doctest {
          zig = zig-nightly.defaultPackage."x86_64-linux";
        };

      };

  };
}
