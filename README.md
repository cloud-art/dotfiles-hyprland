# Hyprland dotfiles

**Required applications**

- **Initialize subsystem**: systemd
- **Tile manager**: hyprland
- **Idle manager**: hypridle
- **Screen lock manager**: hyprlock
- **Wallpapers manager**: hyprpaper
- **Terminal emulator**: kitty
- **Browser**: firefox
- **File manager**: nautilus
- **Bar**: waybar
- **Notification manager**: swaync
- **Program menu**: wofi
- **Brighrness**: brightnessctl
- **Clipboard**: wl-clipboard
- **Audio server**: PipeWire
- **PipeWire session**: WirePlumber
- **Pulse audio support**: Pipewire Pulse
- **Bluetooth**: bluez
- **Bluetooth manager**: Blueman
- **Media player controller**: Playerctl

**Required utilities**

- **_jq (Used in scripts)_**
- **_yay_**

_To use hyprpm:_

- **_cmake_**
- **_meson_**
- **_cpio_**
- **_pkgconf_**
- **_git_**
- **_gcc_**

**Fonts**

- **otf-font-awesome**
- **material icons**

**Arch installing:**

```sh
$ sudo pacman -S hyprland hypridle hyprlock hyprpaper kitty firefox nautilus waybar swaync wofi brightnessctl wl-clipboard pipewire wireplumber pipewire-pulse bluez blueman playerctl jq yay cmake meson cpio pkgconf git gcc otf-font-awesome
```

**Install AUR packages:**

```sh
$ yay -S Material-Icons
```

**_\*inspired with [ml4w](https://github.com/mylinuxforwork)_**
