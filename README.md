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
- **Audio GUI frontend**: pavucontrol
- **Bluetooth**: bluez
- **Bluetooth manager**: Blueman
- **Media player controller**: Playerctl
- **Screenshot support**: flameshot

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

_To use flameshot:_

- **_xdg-desktop-portal_**
- **_xdg-desktop-portal-hyprland_**

_To mount Google Drive:_

- **_rclone_**

**Fonts**

- **otf-font-awesome**
- **material icons**

**Arch installing:**

```sh
$ sudo pacman -S hyprland hypridle hyprlock hyprpaper kitty firefox nautilus waybar swaync wofi brightnessctl wl-clipboard pipewire wireplumber pipewire-pulse pavucontrol bluez blueman playerctl jq yay cmake meson cpio pkgconf git gcc rclone otf-font-awesome flameshot xdg-desktop-portal xdg-desktop-portal-hyprland
```

**Install AUR packages:**

```sh
$ yay -S ttf-material-icons-git
```

**_\*inspired with [ml4w](https://github.com/mylinuxforwork)_**

**Setting up rclone:**

Create new Google Drive config with name `google-drive`:

```sh
$ rclone config
```

Then set up scripts `/srcipts/drive/...`.
