<div align="center">
  <img src="yumusic.png" alt="YuMusic Logo" width="128" />
  <h1>YuMusic</h1>
  <p>A sleek, standalone music streaming app for Garmin Smartwatches</p>

  [![License: AGPL v3](https://img.shields.io/badge/License-AGPL_v3-blue.svg)](LICENSE.txt)
  [![Connect IQ](https://img.shields.io/badge/Garmin-Connect_IQ-007CC3.svg?logo=garmin)](https://apps.garmin.com/apps/cdb7dbb1-66d9-4bd3-8894-f44e507cdd01)

</div>

---

## 🎵 Overview

**YuMusic** transforms your Garmin watch into a standalone offline music player for your personal **Subsonic-compatible media server** such as Navidrome, Gonic, Airsonic, or Nextcloud Music.

Once connected via the Garmin Connect phone app, you can browse your favorite playlists directly on your watch, download the tracks over Wi-Fi, and enjoy your music offline while running or working out, allowing you to completely leave your phone behind.

## ✨ Key Features

- **Direct Server Sync:** Wirelessly download your playlists straight from your home server to your wrist.
- **Offline Playback:** Listen to your downloaded music anywhere using the high-quality native Garmin music player.
- **Fluid Interface:** A fast, modern layout focused on getting you to your music without the clutter.
- **Instant Local Playback:** Swap between your downloaded playlists in seconds without needing an internet connection.
- **Shuffle All:** Play the full downloaded library with shuffle enabled, even when it was synced through several smaller playlists.
- **Auto-Tracking Offline Scrobbling**: Supports automatic scrobbling to keep your server's listening history updated on the next sync.
- **Audio Quality (Transcoding) Control**: Choose your preferred download audio quality (320, 192, 128, or 96 kbps) through the Garmin Connect app settings to save watch storage.
- **Compact Multi-Playlist Library**: Stores shared tracks once and keeps playlist membership separately, reducing Garmin storage pressure.
- **Safe Playlist Removal**: Removing one local playlist preserves tracks that are still used by another synced playlist.
- **Robust Error Diagnostics**: Built-in connection tester to help you identify firewall or proxy blockages instantly.

---

## 📚 Documentation & Setup

I have comprehensive documentation available to help you configure your server and troubleshoot issues:

- 📖 **[Read the Full Documentation](docs/readme.md)**
- 🚀 **[Installation & Setup Guide](docs/installation.md)**
- 🌐 **[Network Requirements](docs/network-requirements.md)** (MUST READ!)
- 🛠️ **[Troubleshooting Errors](docs/troubleshooting.md)**
- 💻 **[Development Guide](docs/development.md)**
- 📝 **[Changelog](CHANGELOG.md)**
- 🛒 **[Connect IQ Listing Copy](docs/connect-iq-listing.md)**

### Supported Servers
YuMusic officially supports **Subsonic API** compatible endpoints.
- ✅ **Navidrome** (Highly Recommended)
- ✅ **Gonic**
- ✅ **Airsonic**
- ✅ **Nextcloud Music** (Requires Legacy Auth enabled)
- ❌ **Jellyfin** (Not natively supported. Use a Subsonic API bridge/plugin, or run Navidrome pointed at the same music folder).

### ⚠️ Important: Network Requirements
YuMusic accepts both `http://` and `https://` server URLs. HTTP is plain-text and does not use certificates; HTTPS uses TLS and requires a certificate trusted by the phone/watch. For reliable syncing, expose your server to Garmin as HTTPS with a publicly trusted certificate. Read more in the [Networking Docs](docs/network-requirements.md).

### ⚠️ Important: Playlist and Watch Limits
Garmin watches have strict memory and persistent-storage limits. YuMusic stores the local library compactly and avoids persisting authenticated stream URLs, but each individual Subsonic `getPlaylist` response still has to fit in watch memory while it is parsed. Keep playlists reasonably sized on memory-limited models.

---

## 🛠 SDK and API Version

- **SDK Version:** 9.2.0
- **API Version:** 5.0.0

## 📝 License

YuMusic is open-source software licensed under the **AGPL-3.0 License**. See the `LICENSE.txt` file for complete details.
