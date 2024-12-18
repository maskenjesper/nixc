{inputs, ...}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix.enable = true;
  stylix.targets.kubecolor.enable = false;
}
