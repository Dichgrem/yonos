{lib, ...}:
with lib; {
  services.ntpd-rs = {
    enable = true;
    settings = {
      source = [
        {
          address = "ntppool1.time.nl";
          mode = "nts";
        }
        {
          address = "ntppool2.time.nl";
          mode = "nts";
        }
        {
          address = "nts.netnod.se";
          mode = "nts";
        }
      ];
    };
    useNetworkingTimeServers = false;
  };
  systemd.services.ntpd-rs = {
    after = mkForce [];
    requires = mkForce [];
    wantedBy = mkForce [];
    wants = mkForce [];
  };
}
