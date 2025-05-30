{pkgs, ...}: {
  programs.chromium = {
    commandLineArgs = [
      "--enable-wayland-ime"
      "--ozone-platform=wayland"
      "--ozone-platform-hint=auto"
      "--password-store=basic"
    ];
    enable = true;
    extensions = [
      {
        # Dark Reader
        id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
      }
      {
        # ClearURLs
        id = "lckanjgmijmafbedllaakclkaicjfmnk";
      }
      {
        # Cookie-Editor
        id = "hlkenndednhfkekhgcdicdfddnkalmdm";
      }
      {
        # KISS Translator
        id = "bdiifdefkgmcblbcghdlonllpjhhjgof";
      }
      {
        # LocalCDN
        id = "njdfdhgcmkocbgbhcioffdbicglldapd";
      }
      {
        # Surfingkeys
        id = "gfbliohnnapiefjpjlpjnehglfpaknnc";
      }
      {
        # uBlock Origin
        id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
      }
      {
        # User-Agent Switcher and Manager
        id = "bhchdcejhohfmigjafbampogmaanbfkg";
      }
      {
        # Violentmonkey
        id = "jinjaccalgkegednnccohejagnlnfdag";
      }
      {
        # Wappalyzer
        id = "gppongmhjkpfnbhagpmjfkannfbllamg";
      }
    ];
    package = pkgs.brave;
  };
}
