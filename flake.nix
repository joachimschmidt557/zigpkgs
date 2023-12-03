{
  description = "A collection of Zig packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    zig-overlay.url = "github:mitchellh/zig-overlay";
  };

  outputs =
    { self, nixpkgs, flake-utils, zig-overlay }:
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
            buildZig_0_9_0_Project = pkgs.callPackage ./pkgs/development/build-zig-project.nix {
              zig = zig-overlay.packages.${system}."0.9.0";
            };
            buildZig_0_10_0_Project = pkgs.callPackage ./pkgs/development/build-zig-project.nix {
              zig = zig-overlay.packages.${system}."0.10.0";
            };
            buildZig_0_11_0_Project = pkgs.callPackage ./pkgs/development/build-zig-project.nix {
              zig = zig-overlay.packages.${system}."0.11.0";
            };
            buildZigNightlyProject = pkgs.callPackage ./pkgs/development/build-zig-project.nix {
              zig = zig-overlay.packages.${system}.master;
            };
          in
          {

            aro = pkgs.callPackage ./pkgs/aro {
              buildZigProject = buildZigNightlyProject;
            };

            bork = pkgs.callPackage ./pkgs/bork {
              buildZigProject = buildZig_0_9_0_Project;
            };

            brightnessztl = pkgs.callPackage ./pkgs/brightnessztl {
              buildZigProject = buildZig_0_11_0_Project;
            };

            gyro = pkgs.callPackage ./pkgs/gyro {
              buildZigProject = buildZigNightlyProject;
            };

            vpkz = pkgs.callPackage ./pkgs/vpkz {
              buildZigProject = buildZigNightlyProject;
            };

            zig-doctest = pkgs.callPackage ./pkgs/zig-doctest {
              buildZigProject = buildZigNightlyProject;
            };

            zigfd = pkgs.callPackage ./pkgs/zigfd {
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
