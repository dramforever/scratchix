{ busybox, bootstrap-tarball }:

derivation {
  system = "x86_64-linux"; # FIXME
  name = "bootstrap";
  builder = busybox;
  args = [ "ash" "-e" ./unpack-bootstrap-tools.sh ];
  tarball = bootstrap-tarball;
}
