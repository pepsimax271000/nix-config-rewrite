{ pkgs, ... }: {

  # user-level gaming config
  # system-level steam + gamemode is in modules/nixos/desktop/gaming.nix

  home.packages = with pkgs; [
    mangohud
    protonup-qt
    bottles
  (prismlauncher.override {
    # Add binary required by some mod
    additionalPrograms = [ ffmpeg ];
  
    # Change Java runtimes available to Prism Launcher
    jdks = [
      graalvmPackages.graalvm-ce
      zulu8
      zulu17
      zulu
    ];
    })
  ];

  xdg = {
    configFile = {
      "MangoHud/MangoHud.conf" = {
        text = ''
          fps
          gpu_stats
          cpu_stats
          ram
          vram
          frame_timing
          position=top-left
          toggle_hud=Shift_R+F12
        '';
      };
    };
  };

}
