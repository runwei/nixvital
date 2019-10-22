{ config, lib, pkgs, ... }:

let cfg = config.bds.web;

in {
  imports = [ ./cgit.nix ];

  options.bds.web = {
    enable = lib.mkEnableOption "Enable Hosted Web Services";
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ 80 443 ];
    services.nginx = {
      enable = true;
      package = pkgs.nginxMainline;
      recommendedOptimisation = true;
      recommendedGzipSettings = true;
      recommendedProxySettings = true;

      virtualHosts = let template = {
        enableACME = true;
        forceSSL = true;
      }; in {
        # The home page
        "breakds.org" = template // {
          root = "/home/delegator/www/breakds.org";
        };
        "files.breakds.org" = template // {
          locations."/".proxyPass = "http://localhost:5962";
        };
        "git.breakds.org" = template // {
          locations."/".proxyPass = "http://localhost:5964";
        };
      };
    };
  };
}
