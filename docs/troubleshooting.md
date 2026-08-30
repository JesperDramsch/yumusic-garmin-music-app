# Troubleshooting

If you are experiencing issues, open YuMusic on your watch, scroll to the bottom of the menu, and select **Test Connection**. This will give you a specific error code.

## Network & Connectivity Errors

### `-1001 (Secure Connection Required)`
Garmin's networking stack rejected the connection before YuMusic could talk to your server.
* **Cause**: This is usually triggered by `http://`, a local IP, a self-signed certificate, or a TLS/certificate chain the phone or watch does not trust.
* **Solution**: YuMusic accepts both HTTP and HTTPS URLs, but HTTPS with a publicly trusted certificate is the reliable setup. See [Network Requirements](network-requirements.md).

### `-300 (Timeout / Local IP?)`
The watch could not reach the server within the time limit. 
* **If you are using a Local IP (`192.168.x.x`)**: This happens if your phone is currently using mobile data (4G/5G) instead of being connected to your home Wi-Fi. The phone cannot route to your local network.
* **If you are using a public URL**: Your firewall might be blocking the connection, or your server is down.

### `Sync failed: 0` (Invalid Download Response)
The watch successfully connected to your server and selected tracks, but Garmin did not return a valid persisted audio item after the download request.
* **Cause**: Usually caused by the server returning a non-audio response, missing/invalid download metadata, an interrupted Wi-Fi transfer, or HTTP being blocked by the watch/phone stack.
* **Solution**: Use YuMusic 1.10.1 or later, verify that your server's `/rest/stream.view` returns an `audio/*` content type, and prefer HTTPS with a publicly trusted certificate.

### `-404` or `-401`
Incorrect credentials, or incorrect Subsonic API endpoint. Ensure you don't have trailing spaces in your URL or username.

## Watch & Memory Errors

### Garmin `Media Error` when selecting a playlist
Older YuMusic versions stored every selected song, including full authenticated stream URLs, in one large Garmin storage value. Selecting more playlists could exceed Garmin's per-value storage limit and crash the media provider.
* **Solution**: Upgrade to YuMusic 1.10.1 or later. The library is now stored as compact per-track records and old libraries are migrated automatically.

### `-403` (Memory Exhaustion / Out of Memory)
Garmin watches have extremely limited RAM for parsing JSON. If you select a playlist that has hundreds or thousands of songs, the server attempts to send the entire tracklist at once, crashing the Garmin memory limit.
* **Solution**: Keep each playlist response reasonably sized. YuMusic reduces local storage usage, but Garmin still has to parse the complete `getPlaylist` JSON response in memory.

### `-400 (Bad Request)`
Usually means the JSON response from the server was malformed or too large for the proxy to pass down to the watch.
