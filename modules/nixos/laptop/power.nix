{ config, lib, pkgs, ... }: lib.mkIf config.custom.laptop.enable {

  services = {

    tlp = {
      enable = true;

      settings = {
        CPU_SCALING_GOVERNOR_ON_AC  = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC  = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      };

    };

    auto-cpufreq = {
      enable = true;

      settings = {
        battery = {
          governor  = "powersave";
          turbo     = "never";
        };
        charger = {
          governor  = "performance";
          turbo     = "auto";
        };
      };

    };

    upower = {
      enable = true;
    };

  };

  powerManagement = {
    enable = true;
  };

}
