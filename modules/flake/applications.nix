{
  perSystem = {self', ...}: {
    apps = {
      default = self'.apps.install;

      install = {
        type = "app";
        program = "${self'.packages.nixcInstaller}/bin/nixcInstaller";
      };
    };
  };
}
