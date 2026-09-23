# AGENTS.md

NixOS + home-manager dotfiles flake, deployed at `~/nixc` on machine `saturn` (this checkout). Built with flake-parts + `vic/import-tree`.

## Layout & how modules get wired
- `flake.nix` passes `./modules` to import-tree: every `.nix` file under `modules/` is auto-imported as a flake-parts module. Adding a file requires NO registration; paths containing `/_` are skipped.
- Each file declares its own flake attrs. Feature modules usually emit both `flake.nixosModules.<name>` and `flake.homeModules.<name>`.
- `modules/flake/` = framework (root.nix imports the home-manager flake module; parts.nix sets systems + `formatter = alejandra`).
- `modules/hosts/<host>/default.nix` defines `flake.nixosConfigurations.<host>`; `modules/hosts/<host>/users/<user>@<host>/default.nix` defines `flake.homeConfigurations."<user>@<host>"`. Hosts pull features via `imports = with self.nixosModules; [...]`.
- `modules/feature/<name>/` = reusable features; dotfiles are shipped with `home.file.<x>.source = ./dotfiles`.
- `templates/feature/default.nix` sketches a new feature module but is NOT wired into the flake outputs (flake.nix only imports `./modules`) — do not rely on `nix flake init -t`.

## Machines & branches
- This branch (`saturn-dendritic`) only defines hosts `saturn` and `iso`. Other machines (jupiter, tellus, stinkpad, dendritic, ...) each live in their own branch with an older `profiles/` + `tasks/` layout — don't copy structure or module names from another branch.

## Commands
- Real switch flow on the machine: `just sync` → `nh home switch ~/nixc` then `nh os switch ~/nixc --impure`, finishing with an auto-commit whose message is the generation timestamp. Scripts: `modules/feature/just/dotfiles/sync*.sh`.
- Any eval/build of a NixOS config MUST use `--impure`: `modules/system/core/hardware.nix` imports the absolute path `/etc/nixos/hardware-configuration.nix`, which pure eval forbids (`nix eval .#nixosConfigurations.saturn...` fails cleanly without `--impure`).

## Gotchas
- The flake is read from the git tree: untracked files are invisible to eval/build. `git add` new modules/dotfiles before rebuilding (the sync scripts do `git add --all`).
- `nix run .#install` / `.#apps.install` is broken: `modules/scripts/install.nix` references `assets/scripts/install.sh`, which doesn't exist on this branch. The README's install command targets the old repo layout and is stale.
- `modules/system/core/nix_settings.nix` uses `inputs.nixpkgs-unstable`, which is NOT declared in `flake.nix` (this only errors if something forces `pkgs.unstable`); `nixpkgs-treesitter` is declared but unused.
