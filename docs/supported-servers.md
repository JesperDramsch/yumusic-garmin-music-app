# Supported Servers

YuMusic is designed to communicate with **Subsonic API** compatible media servers. 

## Fully Supported Servers
* **Navidrome** (Highly recommended, extremely fast and lightweight)
* **Gonic**
* **Airsonic / Airsonic-Advanced**
* **Nextcloud Music** (Requires enabling "Legacy Authentication" in YuMusic settings, and generating an App/API password in Nextcloud).

## A Note on Jellyfin
**Jellyfin is not natively supported by YuMusic.**

Jellyfin uses a proprietary API and does not natively support the Subsonic API standard. Creating and maintaining a completely separate Jellyfin API client within YuMusic is outside the scope of this project.

**Options for Jellyfin Users:**
Use a compatible Subsonic API bridge/plugin, or install Navidrome alongside Jellyfin and point it at the same music directory. YuMusic can then connect to the Subsonic-compatible endpoint to sync tracks to your watch.
