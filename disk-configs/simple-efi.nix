# Example to create a bios compatible gpt partition
{ lib, config, ... }: {
  disko.devices.disk = {
    one = {
      # Change this device name match your block device.
      # The `lsblk` command can help you here
      device = lib.mkDefault "/dev/sda";
      type = "disk";
      content = {
        type = "gpt";
        partitions = lib.optionalAttrs config.boot.loader.grub.enable
          {
            boot = {
              name = "boot";
              size = "1M";
              type = "EF02";
            };
          } // {
          ESP = {
            size = "500M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          root = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
        };
      };
    };
  };
}
