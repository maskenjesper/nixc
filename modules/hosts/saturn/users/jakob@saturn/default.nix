{
  self,
  inputs,
  ...
}: {
  flake.homeConfigurations."jakob@saturn" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      self.homeModules.saturn-jakob-configuration
    ];
  };
}
