# Lenovo Legion 5 Pro AMD config notes

## Extra kernel parameters

```sh
GRUB_CMDLINE_LINUX="... acpi_backlight=nvidia_wmi_ec"
```

then update grub

```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## Troubleshooting

### System does not return from suspend

https://wiki.archlinux.org/title/NVIDIA/Troubleshooting

Add the `acpi_osi=! "acpi_osi=Windows 2015"` kernel parameter to your boot loader configuration.
