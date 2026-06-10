```markdown
# 🎵 Termux Spotify Downloader & Music Player

> A hybrid CLI music tool for Android (Termux) – Spotify-style search + reliable YouTube fallback, powered by `yt-dlp` and `mpv`.

![GitHub Repo](https://img.shields.io/badge/repo-Nihilanthrope%2FSpotifyOnTermux-blue?logo=github)
![Platform](https://img.shields.io/badge/platform-Termux%20(Android)-green?logo=android)
![License](https://img.shields.io/badge/license-MIT-brightgreen)

---

## 🎬 Demo

### 🔍 Searching & downloading a song (yt-dlp fallback)
![YouTube search demo](https://media.giphy.com/media/xT9DPldJHzZKtORo3C/giphy.gif)  
*(Placeholder – replace with actual screen recording)*

### 🎧 Playing downloaded MP3 with mpv
![mpv playback demo](https://media.giphy.com/media/l0HlBO7eyXz5kA4nK/giphy.gif)  
*(Placeholder – replace with actual screen recording)*

---

## ✨ Features

- 🎯 **Spotify‑style search** – use `spotdl` (optional) for Spotify links / song names
- 🧠 **YouTube fallback** – `yt-dlp` with `ytsearch:` works **reliably** on Android
- 💾 **MP3 download** – extracts audio, converts to MP3, embeds thumbnails
- 🔊 **mpv playback** – plays your files right in the terminal
- 📱 **100% offline** after download – listen without internet
- ⌨️ **CLI only** – no GUI required, perfect for Termux
- 🚀 **Lightweight** – runs on any Android device, no root needed

---

## 📋 Requirements (Termux packages)

Install all dependencies with a single command:

```bash
pkg update && pkg upgrade -y
pkg install python ffmpeg mpv yt-dlp git rust clang make -y
```

Optionally, for Spotify downloading (may be unstable):

```bash
pip install spotdl
```

---

⚙️ Installation

1. Set up Termux (if not already done):
   ```bash
   pkg update && pkg upgrade
   pkg install python git
   ```
2. Clone the repository:
   ```bash
   git clone https://github.com/Nihilanthrope/SpotifyOnTermux.git
   cd SpotifyOnTermux
   ```
3. (Optional) Install spotdl (Spotify support, may break on Android):
   ```bash
   pip install --user spotdl
   # Add ~/.local/bin to PATH (see Troubleshooting)
   ```
4. Verify your tools:
   ```bash
   yt-dlp --version
   mpv --version
   ```

---

🚀 Usage

All commands are run inside the SpotifyOnTermux directory (or anywhere if tools are globally installed).

🔹 Method 1: Spotify links / songs with spotdl (optional)

```bash
# Download a Spotify track
spotdl "https://open.spotify.com/track/4cOdK2wGLETKBW3PvgPWqT"

# Search and download a song by name (uses Spotify metadata)
spotdl "song name - artist"
```

⚠️ spotdl relies on unofficial Spotify endpoints and may break due to tls-client or other dependencies. Use the YouTube fallback if it fails.

🔹 Method 2: YouTube search fallback (stable, recommended)

```bash
# Search YouTube, download best audio, convert to MP3
yt-dlp -x --audio-format mp3 --embed-thumbnail "ytsearch:shape of you ed sheeran"
```

🔊 Playing back your MP3 files

```bash
mpv "song name.mp3"
# or, to play all MP3s in a folder
mpv *.mp3
```

---

🧩 Example Workflows

Download + play in one command (yt-dlp fallback)

```bash
yt-dlp -x --audio-format mp3 "ytsearch:blinding lights" -o "%(title)s.%(ext)s" && mpv *.mp3
```

This downloads the first YouTube result for “blinding lights”, converts it to MP3, and immediately plays the file.

Simulate Spotify‑style search using only yt-dlp

```bash
# Search with a "song - artist" pattern, download MP3, display progress
yt-dlp -x --audio-format mp3 --embed-thumbnail -o "~/Music/%(title)s.%(ext)s" "ytsearch:dance monkey tones and i"
```

You get a clean, tagged MP3 ready for offline listening – no Spotify account needed.

---

📂 Where are the downloaded files?

· Default output: current working directory (usually ~/SpotifyOnTermux/)
· You can change the save folder with -o "/path/to/folder/%(title)s.%(ext)s" (e.g., -o "~/Music/%(title)s.%(ext)s")
· All files are standard MP3s playable by any music player on your device.

---

🔧 Troubleshooting

Problem Solution
spotdl: command not found spotdl was installed with --user. Add export PATH="$HOME/.local/bin:$PATH" to your .bashrc and restart Termux.
spotdl crashes / tls-client error This is a known Android issue. Switch to the yt-dlp fallback – it’s stable and does the same job.
yt-dlp not found Run pkg install yt-dlp again, or update it: pip install -U yt-dlp
mpv can't play audio Ensure you installed mpv via pkg install mpv. If no sound, check Android media volume and Termux notification settings.
Downloaded file has no thumbnail Make sure ffmpeg is installed (pkg install ffmpeg). yt-dlp needs it for embedding art.

---

📝 Notes

· Spotify API is NOT used. spotdl downloads music by mimicking the web player – it may break at any time.
· spotdl is entirely optional and known to be unstable on Android due to missing system libraries (like tls-client).
· yt-dlp + mpv is the main, bullet‑proof method for this tool. It works 100% offline after download.
· All features are command‑line based. No graphical interface required – perfect for Termux.

---

🔮 Future Improvements

· Playlist support – download and manage entire YouTube/Spotify playlists
· Terminal UI menu – interactive selection using fzf or a simple bash dialog
· Lyrics display – fetch and show synced lyrics during playback
· Folder organisation – auto‑sort downloads by artist/album
· Live wallpaper sync – optionally link to a music visualiser on Android

Pull requests are welcome!

---

⚖️ License

This project is free to use under the MIT License.
You are free to copy, modify, and distribute this tool as long as the original license is retained.

---

Enjoy your ad‑free, offline music experience – right from the terminal! 🎧

```
