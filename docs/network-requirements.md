# Network Requirements

YuMusic relies on Garmin's `Communications` module to access your server. The app accepts both `http://` and `https://` URLs, but the request still has to pass through Garmin Connect Mobile, the phone operating system, and the watch Wi-Fi downloader.

## HTTP vs HTTPS
HTTP can work in some local setups, especially while browsing playlists through the phone connection. It is less reliable for audio sync because Garmin's platform may reject insecure traffic before YuMusic receives a useful response.

HTTPS with a publicly trusted certificate is strongly recommended because it works with both playlist browsing and watch Wi-Fi downloads more consistently.

## Why Local IPs (e.g., `192.168.1.100`) Often Fail
If you configure a local IP, the phone and watch both need a route to that address at the moment Garmin performs the request. If your phone is on cellular data instead of your local Wi-Fi, the proxy can time out with `-300`. Some firmware or mobile OS combinations may also reject insecure local HTTP with `-1001`.

## Recommended Server Setup
Expose your server over HTTPS with a valid, publicly trusted SSL certificate. Self-signed certificates are usually rejected by Garmin devices or the phone proxy.

Common options:
- **Cloudflare Tunnels (Zero Trust)**: The easiest method. Cloudflare generates the HTTPS certificate automatically and tunnels traffic safely to your local server without port forwarding.
- **Tailscale**: Using Tailscale's "MagicDNS" and "HTTPS Certs" features provides a secure, encrypted domain name for your server.
- **Reverse Proxy**: Use Nginx Proxy Manager, Caddy, or Traefik with Let's Encrypt certificates.

## Audio Download Requirements
For sync, your Subsonic `/rest/stream.view` response must return an `audio/*` content type and a usable `Content-Length`. YuMusic requests MP3 streams with `estimateContentLength=true` so Navidrome-compatible servers can provide the length Garmin expects.
