# Nixfiles

> _Die Kunst und **Nix** als die Kunst!_

[![NixOS](https://img.shields.io/badge/NixOS-fafafa?style=for-the-badge&logo=nixos)](https://nixos.org)
[![Niri](https://img.shields.io/badge/Niri-1f1f1f?style=for-the-badge&logo=niri)](https://github.com/niri-wm/niri)
[![Neovim](https://img.shields.io/badge/Neovim-0f191f?style=for-the-badge&logo=neovim)](https://neovim.io)
[![Zsh](https://img.shields.io/badge/Zsh-ffffff?style=for-the-badge&logo=zsh)](https://www.zsh.org)

| Table of Contents |
| :---: |
| [Structure](#structure) |
| [Overview](#overview) |
| [Installation](#installation) |
| [Templates](#templates) |

## Structure

- `flake.nix`, `flake.lock`: inputs and outputs (NixOS config + templates)
- `configuration.nix`: system-level configuration
- `hardware-configuration.nix`: hardware config for `nykr` (I run it on ThinkPad T480)
- `noctalia.nix`: Noctalia shell configuration
- `home.nix`: Home Manager entry point
- `home-manager/`: per-program modules (
  - `git.nix`,
  - `zsh.nix`,
  - `niri.nix`,
  - `neovim.nix`,
  - `alacritty.nix`,
  - `fastfetch.nix`,
  - `obs-studio.nix`
  )
- `templates/rust/`: flake template with a Rust dev shell (`flake.nix`, `.envrc`)
- `wallpapers/`: wallpapers (`nixos.png`)

## Overview

<img width="1920" height="1080" alt="nykr" src="https://github.com/user-attachments/assets/eef059b7-4a7d-4cf0-b2d7-2f9d27867d2f" />
<p align="center">
  <samp>kirigirisu@nykr</samp>
</p>

This is my very first NixOS configuration; it will improve gradually.

It's a flake that uses `nixpkgs-unstable`. The system is set up in `configuration.nix`, and everything about my user (shell, editor, terminal and so on) is managed by Home Manager, with one small file per program in `home-manager/`.

I use Niri as my window manager, with Noctalia as the shell on top of it. Colors and fonts come from Stylix, so everything looks the same across apps.

There's also a small Rust dev shell template in `templates/rust/` that I use for my projects.

## Installation

> [!WARNING]
> `hardware-configuration.nix` is specific to my machine. Generate your own
> before building, or the system may not boot.

**Step 1.** Clone the repo:
```sh
   git clone https://github.com/mlxviikuznetsov/nixfiles ~/nixfiles
   cd ~/nixfiles
```

**Step 2.** Regenerate the hardware config:
```sh
   nixos-generate-config --show-hardware-config > hardware-configuration.nix
```

**Step 3.** Change the username (`kirigirisu`) and hostname (`nykr`) to yours in `flake.nix`, `configuration.nix` and `home.nix`.

**Step 4.** Build and switch:
```sh
   sudo nixos-rebuild switch --flake .#nykr
```

To update inputs: `nix flake update`, then rebuild.

## Templates

Initialize a Rust dev shell flake:

```sh
nix flake init -t github:mlxviikuznetsov/nixfiles#rust
```
