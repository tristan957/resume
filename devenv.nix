# SPDX-License-Identifier: GPL-3.0-or-later
#
# SPDX-FileCopyrightText: Tristan Partin <tristan@partin.io>
{
  config,
  pkgs,
  lib,
  ...
}: let
  typst = pkgs.typst.withPackages (p: [p.fontawesome]);
  fonts = "${pkgs.cantarell-fonts}/share/fonts:${pkgs.font-awesome}/share/fonts";
in {
  imports = [
    {
      options.resume.development.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = ''
          Whether to configure the development environment: tools, git hooks,
          formatters, and the preview server. Disable to only consume
          `outputs.resume`.
        '';
      };

      options.resume.port = lib.mkOption {
        type = lib.types.port;
        default = 7777;
        description = "Port the preview web server listens on.";
      };
    }
  ];

  config = lib.mkMerge [
    (lib.mkIf config.resume.development.enable {
      packages = with pkgs; [
        typst
        typstyle
      ];

      env.TYPST_FONT_PATHS = fonts;

      git-hooks.hooks = {
        markdownlint.enable = true;
        reuse.enable = true;
        treefmt.enable = true;
      };

      treefmt = {
        enable = true;

        config = {
          projectRootFile = "devenv.nix";

          programs = {
            alejandra.enable = true;
            biome = {
              enable = true;
              includes = ["*.json" "*.md" "*.yaml" "*.yml"];
              settings = {
                formatter = {
                  indentStyle = "space";
                  lineWidth = 80;
                };
                markdown.formatter.proseWrap = "always";
              };
            };
            typstyle.enable = true;
          };
        };
      };

      services.caddy = {
        enable = true;
        virtualHosts."http://localhost:${toString config.resume.port}".extraConfig =
          # caddyfile
          ''
            root * ${config.outputs.resume}
            file_server browse
          '';
      };

      enterTest =
        # bash
        ''
          wait_for_port ${toString config.resume.port}
          type="$(curl -fsS -o /dev/null -w '%{content_type}' 'http://localhost:${toString config.resume.port}/resume.pdf')"
          [ "$type" = application/pdf ]
        '';
    })

    {
      outputs.resume = pkgs.stdenvNoCC.mkDerivation {
        pname = "tristan-partin-resume";
        version = "1.0";

        src = lib.fileset.toSource {
          root = ./.;
          fileset = lib.fileset.unions [
            ./data
            ./icon.typ
            ./resume.typ
            ./style.typ
            ./sections
          ];
        };

        nativeBuildInputs = [typst];

        env.TYPST_FONT_PATHS = fonts;

        buildPhase = ''
          runHook preBuild
          typst compile resume.typ resume.pdf
          runHook postBuild
        '';

        installPhase = ''
          runHook preInstall
          install -Dm644 resume.pdf $out/resume.pdf
          runHook postInstall
        '';
      };
    }
  ];
}
