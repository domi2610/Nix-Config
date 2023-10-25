{ ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l --color=auto";
      la = "ls -A --color=auto";
      lla = "ls -lA --color=auto";
      pipewire-restart =
        "systemctl --user restart pipewire.service && systemctl --user restart wireplumber";
      webserver-ssh = "ssh ubuntu@144.24.186.232";
      webserver-mount = "sshfs ubuntu@144.24.186.232:/home/ubuntu ~/mnt";
      nix-update = "nix flake update ~/Projects/NixOS-Config/";
      nix-clean = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
      nix-lock-upload = "git add . && git commit -m 'nix: update' && git push";
      setup-direnv = "echo 'use flake' >> .envrc && direnv allow";
    };
  };
}
