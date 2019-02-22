resource nfsdrbd {
 protocol C;
 meta-disk internal;
 device /dev/drbd0;
 syncer {
  verify-alg sha1;
 }
 net {
  allow-two-primaries;
 }
 on nfsnode01 {
  disk   /dev/nfsvg/nfslv;
  address  192.168.10.10:7789;
 }
 on nfsnode02 {
  disk   /dev/nfsvg/nfslv;
  address  192.168.10.11:7789;
 }
}

