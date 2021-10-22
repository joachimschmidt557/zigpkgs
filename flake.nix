{
  description = "A collection of Zig packages";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    zig-overlay.url = "github:arqv/zig-overlay";
    zig-nightly.url = "github:chivay/zig-nightly";
  };

  outputs =
    { self, nixpkgs, flake-utils, zig-overlay, zig-nightly }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      hydraSystems = [ "x86_64-linux" ];
    in
    flake-utils.lib.eachSystem systems
      (system:
      {

        packages =
          let
            pkgs = nixpkgs.legacyPackages.${system};
            buildZig081Project = pkgs.callPackage ./pkgs/development/build-zig-project.nix {
              zig = pkgs.zig;
            };
            buildZigNightlyProject = pkgs.callPackage ./pkgs/development/build-zig-project.nix {
              zig = zig-nightly.defaultPackage.${system};
            };
          in
          {

            brightnessztl = pkgs.callPackage ./pkgs/brightnessztl {
              buildZigProject = buildZigNightlyProject;
            };

            gyro = pkgs.callPackage ./pkgs/gyro {
              buildZigProject = buildZigNightlyProject;
            };

            river = pkgs.callPackage ./pkgs/river {
              buildZigProject = buildZig081Project;
            };

            vpkz = pkgs.callPackage ./pkgs/vpkz {
              buildZigProject = buildZigNightlyProject;
            };

            zig-doctest = pkgs.callPackage ./pkgs/zig-doctest {
              buildZigProject = buildZigNightlyProject;
            };

            zigmod = pkgs.callPackage ./pkgs/zigmod {
              buildZigProject = buildZigNightlyProject;
            };

            zls = pkgs.callPackage ./pkgs/zls {
              buildZigProject = buildZigNightlyProject;
            };

          };

      }
      ) // {
      hydraJobs = builtins.foldl' nixpkgs.lib.recursiveUpdate { }
        (builtins.map
          # Turn system.pname into pname.system
          (system: builtins.mapAttrs
            (pname: pkg: { ${system} = pkg; })
            self.packages.${system})
          hydraSystems);
    };
}
