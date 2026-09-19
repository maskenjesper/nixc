{
  self,
  inputs,
  self',
  ...
}: {
  flake.homeConfigurations."jakob@saturn" = inputs.home-manager.lib.homeManagerConfiguration {
    modules = [
      self.homeModules."jakob@saturn"
    ];
    pkgs = self'.packages;
  };
}
