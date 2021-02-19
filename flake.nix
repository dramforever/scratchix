{
  outputs = { self }: {
    packages.x86_64-linux = import ./nix/flattenTree.nix (import ./pkgs/stage1);
    checks = self.packages;
  };
}
