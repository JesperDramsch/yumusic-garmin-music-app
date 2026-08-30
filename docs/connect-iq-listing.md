# Connect IQ Listing Copy

## Recommended Version

1.10.2

## What's New

- Added Shuffle All playback for the full downloaded local library.
- Added Shuffle All to the local playlist picker for users who split a large library into several smaller playlists.
- Fixed a Garmin "Media Error" crash when selecting more playlists for sync.
- Fixed playlist removal so removing one playlist no longer removes tracks that are still used by another synced playlist.
- Reduced local library storage usage by saving compact track records instead of full authenticated stream URLs.
- Improved sync reliability by rebuilding secure stream URLs during sync and validating Garmin's persisted media response before marking tracks as downloaded.
- Improved compatibility with Garmin's persisted media cache by treating downloaded media IDs as opaque content references.
- Added safer handling for older libraries created by previous YuMusic versions.

## Description

YuMusic turns your Garmin watch into a standalone offline music player for your personal Subsonic-compatible server.

Connect YuMusic to a server such as Navidrome, Gonic, Airsonic, or Nextcloud Music, browse your playlists on the watch, download tracks over Wi-Fi, and play them later through Garmin's native music player without carrying your phone.

Key features:

- Direct playlist sync from your own server to your Garmin watch.
- Offline playback through Garmin's native music provider interface.
- Shuffle All playback across the full downloaded local library.
- Support for Subsonic API compatible servers, including Navidrome, Gonic, Airsonic, and Nextcloud Music.
- Legacy authentication option for servers that require password-based Subsonic auth, such as some Nextcloud Music setups.
- Configurable audio bitrate: 320, 192, 128, or 96 kbps.
- Automatic offline scrobble queue that uploads play history on a later sync.
- Safer multi-playlist library handling with shared tracks preserved across playlists.
- Built-in connection test to diagnose server, authentication, and network issues.

Important notes:

- YuMusic accepts both `http://` and `https://` server URLs. HTTP is plain-text and does not use certificates. HTTPS uses TLS and requires a certificate trusted by the phone/watch. For reliable syncing, expose your server to Garmin as HTTPS with a publicly trusted certificate.
- Your server must expose the Subsonic API under `/rest`.
- Audio downloads must return an `audio/*` content type and a usable `Content-Length`. YuMusic requests MP3 streams with `estimateContentLength=true`.
- Garmin watches have strict memory and storage limits. YuMusic now stores the local library more efficiently, but each individual playlist response still has to fit in the watch memory while it is being parsed. Keep playlists reasonably sized on memory-limited models.
- Jellyfin is not supported directly unless you use a compatible Subsonic API bridge/plugin. The recommended setup is Navidrome pointed at the same music library.

YuMusic is free and open source.

Report bugs:
https://github.com/isyuricunha/yumusic-garmin-music-app/issues
