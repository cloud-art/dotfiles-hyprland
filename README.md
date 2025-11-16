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
- **Control Theme**: qt6ct, nwg-look, adwaita-dark

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

- **_ttf-google-fonts-git_**

**Theme**

- **_qt6ct_**
- **_nwg-look_**
- **_gnome-themes-extra_**
- **_gnome-themes-extra-gtk2_**
- **_adwaita-qt5-git_**
- **_adwaita-qt6-git_**

**Arch installing:**

```sh
$ sudo pacman -S hyprland hypridle hyprlock hyprpaper kitty firefox nautilus waybar swaync wofi brightnessctl wl-clipboard pipewire wireplumber pipewire-pulse pavucontrol bluez blueman playerctl jq cmake meson cpio pkgconf git gcc rclone otf-font-awesome flameshot xdg-desktop-portal xdg-desktop-portal-hyprland gnome-themes-extra
```

**Install AUR packages:**

```sh
$ yay -S ttf-google-fonts-git gnome-themes-extra-gtk2 adwaita-qt5-git adwaita-qt6-git
```

**_\*inspired with [ml4w](https://github.com/mylinuxforwork)_**

**Setting up rclone:**

Create new Google Drive config with name `google-drive`:

```sh
$ rclone config
```

Then set up scripts `/scripts/drive/...`.

**Settings up vscode:**

```sh
yay -S visual-studio-code-bin sudo pacman gnome-keyring libsecret
```

Then go into `>Preferences: Configure runtime arguments` and add: `"password-store": "gnome-libsecret"`

Also go into `>User:settings(JSON)` and configure `"http.proxy"`
