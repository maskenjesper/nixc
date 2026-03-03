let
  tellus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF9qkz9NvcXxSHwVpgOklG8WaOsKz5QIYzgLsJMaoYt0";
  systems = [tellus];
in {
  "secret1.age".publicKeys = [tellus];
}
