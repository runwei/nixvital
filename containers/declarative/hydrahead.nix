# To disable the container, just remove it from configuration.nix and
# run nixos-rebuild switch. Note that this will not delete the root
# directory of the container in /var/lib/containers. Containers can be
# destroyed using the imperative method: nixos-container destroy foo.

{ config, lib, pkgs, ... }:

{

  # Declarative containers can be started and stopped using the
  # corresponding systemd service, e.g.
  # systemctl start container@hydrahead.
  
  containers.hydrahead = {
    autoStart = true;

    privateNetwork = true;
    hostAddress = "192.168.88.26"; 
    localAddress = "192.168.88.27";
    
    config = { config, pkgs, ... }: {
      imports = [
        ../container-base.nix
        ../../modules/user.nix
      ];

      environment.systemPackages = with pkgs; [
        (callPackage ../../pkgs/public-web {})
      ];

      fonts.fonts = with pkgs; [
        font-awesome-ttf
      ];

      environment.etc = {
        "bashrc.local".text = ''
          if [ -z "$PS1" ]; then
            return
          fi
          export PS1="\[\033[38;5;81m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@$(echo -e '\uf3b0') $(echo -e '\uf23b') $(echo -e '\uf394')$(echo -e '\uf25d')$(echo -e '\uf1fa') {\[$(tput sgr0)\]\[\033[38;5;228m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]} \\$ \[$(tput sgr0)\]"
      '';
      };

      networking.hostName = "hydrahead";
    };
  };
}
