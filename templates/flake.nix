{
  description = "templates flake";

  outputs = {self, ...}: {
    templates = {
      flutter = {
        path = ./flakes/flutter;
        description = "Standard flutter flake";
      };
      nodejs = {
        path = ./flakes/nodejs;
        description = "Standard nodejs";
      };
      wireguard = {
        path = ./flakes/wireguard;
        description = "wireguard";
      };
    };
  };
}
