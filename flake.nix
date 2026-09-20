{
  description = "My first flake!";

  outputs = {...} @ inputs:
    inputs.flake-parts.lib.mkFlake
    {inherit inputs;}
    (inputs.import-tree ./modules);

  inputs = {
    # nix eco-system
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-treesitter.url = "github:nixos/nixpkgs/932fc16b263f26803d3960e4400bc13dde84a972";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # framework
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";

    # testing
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-melt.url = "github:nix-community/nix-melt";

    # other
    nixCats.url = "github:BirdeeHub/nixCats-nvim";

    gittype.url = "github:unhappychoice/gittype";
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
