<p align="center">
  <img src="https://img.shields.io/badge/Project_Zomboid-Build_42-darkgreen?style=for-the-badge&logo=steam" alt="Build 42"/>
  <img src="https://img.shields.io/badge/Status-Early_Access-orange?style=for-the-badge" alt="Early Access"/>
  <img src="https://img.shields.io/badge/License-MIT-blue?style=for-the-badge" alt="License"/>
</p>

<h1 align="center">🎵 New Music Radio B42</h1>

<p align="center">
  <b>Radio channels for <a href="https://steamcommunity.com/sharedfiles/filedetails/?id=3739256725">Talis New Music</a> in Project Zomboid Build 42</b>
</p>

<p align="center">
  <a href="https://steamcommunity.com/sharedfiles/filedetails/?id=3746101672">
    <img src="https://img.shields.io/badge/Steam_Workshop-Subscribe-171a21?style=for-the-badge&logo=steam&logoColor=white" alt="Steam Workshop"/>
  </a>
</p>

---

## ⚠️ Early Access

> **This mod is currently in development and may present instability.**
> Please report any issues on the [Issues](https://github.com/KleitonEwerton/New-Music-Radio-B42/issues) page.

---

## 📖 About

**New Music Radio B42** is an adaptation of [True Music Radio](https://steamcommunity.com/sharedfiles/filedetails/?id=3100475013) designed to work with [Talis New Music](https://steamcommunity.com/sharedfiles/filedetails/?id=3739256725).

It adds custom radio stations to Project Zomboid that play tracks from the New Music mod, bringing your in-game radios and TVs to life with a curated music experience.

---

## 🎧 Features

| Feature | Details |
|---|---|
| 📻 **5 FM Radio Channels** | 93.0 / 93.2 / 93.4 / 93.6 / 93.8 FM |
| 📺 **1 MTV TV Channel** | Channel 212 |
| 🌦️ **Weather Broadcasts** | Hourly weather forecasts on radio |
| 🎶 **Song Announcements** | RDS-style "Now Playing" display |
| ⚡ **Horde Night Alerts** | EAS warnings when horde night is active |
| 🎚️ **3D Audio** | Distance-based volume with environmental effects |
| ⚙️ **Fully Configurable** | All channels & features configurable via Sandbox Options |
| 🔀 **Independent Playlists** | Each channel has its own shuffled playlist |

---

## 📦 Requirements

| Mod | Link |
|---|---|
| **Talis New Music** | [Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3739256725) |

> **Note:** This mod does **not** conflict with True Music Radio. Both can run simultaneously using different frequencies.

---

## 🔧 Installation

### Steam Workshop (Recommended)
1. Subscribe to [New Music Radio B42](https://steamcommunity.com/sharedfiles/filedetails/?id=3746101672) on Steam Workshop
2. Subscribe to [Talis New Music](https://steamcommunity.com/sharedfiles/filedetails/?id=3739256725)
3. Enable both mods in the Project Zomboid mod manager
4. Start your game!

### Manual Installation
1. Download or clone this repository
2. Copy the `Contents` folder to your PZ mods directory:
   ```
   %USERPROFILE%\Zomboid\Workshop\New Music Radio B42\
   ```
3. Enable the mod in-game

---

## ⚙️ Sandbox Options

All settings are configurable in the **Sandbox Options** menu under `New Music Radio`:

| Option | Default | Description |
|---|---|---|
| Channel 1-5 Frequency | 93.0-93.8 FM | Configurable FM frequencies (88.0-108.0) |
| MTV Channel | 212 | TV channel number (200-220) |
| Weather Broadcast | ✅ On | Hourly weather forecasts |
| Song Announcements | ✅ On | Display currently playing track |
| Horde Night Broadcast | ✅ On | EAS warnings for horde nights |
| Radios Attract Zombies | ❌ Off | Whether radio sound attracts zombies |
| Mood Effects | ✅ On | Music affects player mood |
| Allow Skip on Server | ❌ Off | Allow song skipping in multiplayer |

---

## 🏗️ Project Structure

```
New Music Radio B42/
├── Contents/
│   └── mods/
│       └── ModTemplate/
│           └── 42/
│               ├── mod.info
│               └── media/
│                   ├── sandbox-options.txt
│                   └── lua/
│                       ├── client/NewMusicRadio/    # Client-side logic
│                       │   ├── NMRadio.lua          # Core radio playback
│                       │   ├── NMRClient.lua        # Client networking
│                       │   └── NMRSound.lua         # Sound emitter system
│                       ├── server/NewMusicRadio/    # Server-side logic
│                       │   ├── NMRServer.lua        # Playlist management
│                       │   ├── DynamicNMRadio.lua   # Dynamic channel system
│                       │   └── NMRadioChannel*.lua  # Channel definitions
│                       └── shared/                  # Shared utilities
└── workshop.txt
```

---

## 🤝 Credits

- **Original Mod:** [True Music Radio](https://steamcommunity.com/sharedfiles/filedetails/?id=3100475013) — the foundation this mod is built upon
- **Music System:** [Talis New Music](https://steamcommunity.com/sharedfiles/filedetails/?id=3739256725) — the music provider
- **Adaptation:** [KleitonEwerton](https://github.com/KleitonEwerton) — adaptation for New Music compatibility

---

## 📝 License

This project is available under the [MIT License](LICENSE).

---

<p align="center">
  <sub>Made with ❤️ for the Project Zomboid community</sub>
</p>
<p align="center">
  <sub>kleitonewertonoliveira@gmail.com</sub>
<br>
  <sub>https://github.com/KleitonEwerton</sub>
</p>