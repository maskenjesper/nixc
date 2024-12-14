# This file (and the global directory) holds config that i use on all hosts
{
  inputs,
  outputs,
  ...
}: {
  imports =
    # Include all the modules in this global directory
    [
      ./bluetooth
      ./fonts
      ./xremap
    ]
    # Always import custom modules
    ++ (builtins.attrValues outputs.nixosModules);

  # Apply overlays
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  # Automatically delete generations older than 30 days.
  nix.gc = {
    automatic = true;
    dates = "weelky";
    options = "--delete-older-than 30d";
  };

  # Use flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
