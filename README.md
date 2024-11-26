# Terraform Alias Flake

This Nix flake provides a simple way to use [OpenTofu](https://opentofu.org/) as `terraform`. The purpose of this flake is to create an alias for the `tofu` binary so it can be used in IDE tools or scripts that depend on the command being named `terraform`.

## Motivation

OpenTofu is an open-source alternative to Terraform, but its binary is named `tofu`. Many IDEs, plugins, and tools are hardcoded to look for the `terraform` command. This flake solves this issue by providing the `terraform` alias, allowing seamless integration with such tools while using OpenTofu.

## Installation

You can easily add this flake as `github:claudio4/nix-opentofu-terraform-alias`.
