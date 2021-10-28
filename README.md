# zigpkgs

A collection of Zig packages built with Nix

For a list of all packages, see `flake.nix`.

## Usage

### Using flakes (recommended)

Try out a package in a `nix shell` environment:

```shell
nix shell github:joachimschmidt557/zigpkgs#zigmod
```

Install a package into your profile:

```shell
nix profile install github:joachimschmidt557/zigpkgs#zls
```

### No flake support

Install a package into your profile:

```shell
nix-env -f https://github.com/joachimschmidt557/zigpkgs/archive/trunk.tar.gz -iA packages.x86_64-linux.zls
```

### Cachix support

All packages in the collection are built on every push to the `trunk`
branch and pushed to a Cachix cache via GitHub Actions. It is possible
to add this cache to your Nix configuration so that Nix doesn't need
to build every package from scratch. See the [Cachix
docs](https://docs.cachix.org/) for more information.

```shell
cachix add zigpkgs
```
