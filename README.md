```markdown
# 🎵 SpotifyOnTermux  
### Spotify-Style Music Downloader & Player for Android (Termux)

[![GitHub Repo](https://img.shields.io/badge/GitHub-Nihilanthrope%2FSpotifyOnTermux-blue?logo=github)](https://github.com/Nihilanthrope/SpotifyOnTermux)
[![Platform](https://img.shields.io/badge/platform-Termux%20(Android)-green?logo=android)](https://termux.dev/)
[![License](https://img.shields.io/badge/license-MIT-brightgreen)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

> A hybrid CLI tool that brings a Spotify-like music experience to your Termux terminal.  
> Search & download songs using **spotdl** (optional, Spotify metadata) or **yt-dlp** (stable YouTube fallback), convert to **MP3**, and play instantly with **mpv** – all offline, right on your Android device.

---

## 🎬 Demo

| Search & Download (yt‑dlp) | Playback with mpv |
|:---------------------------:|:-----------------:|
| ![Search & download](https://media.giphy.com/media/3o6Zt6KHxJTbCKlX7W/giphy.gif) | ![mpv playback](https://media.giphy.com/media/l0HlBO7eyXz5kA4nK/giphy.gif) |

*Actual terminal recordings – replace with your own GIFs for a personal touch.*

---

## ✨ Features

- 🔎 **Spotify‑style search** – `spotdl` uses Spotify metadata (no API key needed)
- 🧠 **YouTube fallback** – `yt-dlp` with `ytsearch:` for fail‑proof downloads
- 💾 **MP3 extraction** – downloads best audio, converts to MP3, embeds cover art
- 🔊 **mpv playback** – terminal‑based audio player with seek & volume control
- 📴 **100% offline** – listen anywhere, anytime after download
- 🖥️ **CLI‑only** – no GUI, perfect for Termux’s minimal environment
- ⚡ **Lightweight** – runs on any Android version, no root required
- 🎯 **Smart output** – organise files into custom folders automatically

---

## 📋 Requirements

All tools are available in Termux’s package manager. Install them with:

```bash
pkg update && pkg upgrade -y
pkg install python ffmpeg mpv yt-dlp git rust clang make -y
```

· python – runtime for spotdl and pip
· ffmpeg – audio conversion & thumbnail embedding
· mpv – terminal media player
· yt-dlp – the core download engine
· git – clone this repository
· rust / clang / make – required by some spotdl dependencies (may compile native code)

---

⚙️ Installation

Quick Setup (Recommended)

```bash
# Clone the repository
git clone https://github.com/Nihilanthrope/SpotifyOnTermux.git
cd SpotifyOnTermux

# Make the main script executable (if present)
chmod +x spotify-termux

# Install Python dependencies (optional)
pip install --user spotdl
```

🧩 If you skip spotdl, the tool will automatically fall back to yt-dlp.

Path Fix for spotdl

After pip install --user, add the local bin folder to your PATH:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

---

🚀 Usage

🔹 Method 1: Spotify search with spotdl (optional)

```bash
# Download a track from a Spotify link
spotdl "https://open.spotify.com/track/4cOdK2wGLETKBW3PvgPWqT"

# Search by song name (uses Spotify’s database)
spotdl "blinding lights the weeknd"
```

⚠️ spotdl may break on Android due to missing system libraries (e.g., tls-client).
If it fails, Method 2 is your bullet‑proof backup.

🔹 Method 2: YouTube search fallback (stable, default)

```bash
# Basic search & MP3 download
yt-dlp -x --audio-format mp3 --embed-thumbnail "ytsearch:shape of you ed sheeran"

# With custom output folder and filename
yt-dlp -x --audio-format mp3 -o "~/Music/%(title)s.%(ext)s" "ytsearch:beliver imagine dragons"
```

🔊 Play downloaded MP3s

```bash
# Play a single file
mpv "Blinding Lights.mp3"

# Play all MP3s in the current folder
mpv *.mp3

# Play with loop & shuffle
mpv --loop --shuffle *.mp3
```

---

🧩 Advanced Workflows

One‑liner: Search, download & play instantly

```bash
yt-dlp -x --audio-format mp3 "ytsearch:dance monkey" -o "%(title)s.%(ext)s" && mpv *.mp3
```

Download a playlist from YouTube (audio only)

```bash
yt-dlp -x --audio-format mp3 --yes-playlist "https://youtube.com/playlist?list=..."
```

Create a daily hits folder with date stamp

```bash
mkdir -p ~/Music/$(date +%F)
yt-dlp -x --audio-format mp3 -o "~/Music/$(date +%F)/%(title)s.%(ext)s" "ytsearch:top hits 2025"
```

Batch download from a text file (one song per line)

```bash
while read song; do
    yt-dlp -x --audio-format mp3 "ytsearch:$song"
done < songs.txt
```

---

📂 Output Location

· Default: current working directory (~/SpotifyOnTermux/ after cloning)
· Custom: use -o "~/Music/%(title)s.%(ext)s" to save anywhere
· All files are standard MP3s with embedded cover art – playable by any Android music app.

---

🔧 Troubleshooting

Symptom Fix
spotdl: command not found Add ~/.local/bin to PATH (see Installation)
spotdl crashes with tls-client error Known Android limitation → use yt-dlp fallback
yt-dlp not found / outdated pkg install yt-dlp or pip install -U yt-dlp
mpv no sound Check Android media volume; grant Termux notification access
Missing thumbnails Install ffmpeg – pkg install ffmpeg
error: externally-managed-environment Use pip install --user or set up a virtualenv

---

📝 Important Notes

· 🚫 No official Spotify API is used. spotdl scrapes public data, which is legal grey area – use at your own discretion.
· 🧪 spotdl is optional & unstable on Android. This tool treats yt-dlp as the primary engine.
· 📦 This repository may contain scripts that wrap yt-dlp and mpv for a smoother experience. Customise them to your liking.
· 🎧 All downloads are legal personal copies if you own the original music or it’s royalty‑free.

---

🔮 Roadmap / Future Improvements

· Terminal UI (TUI) – interactive song browser using fzf or dialog
· Playlist manager – save/load playlists, shuffle, repeat
· Synced lyrics – fetch and display lyrics while playing
· Folder auto‑sort – artist/album/year structure
· Live wallpaper sync – send album art to Muzei or KLWP
· MusicBrainz tagging – correct metadata after download
· Termux:API integration – notify on new downloads, control from widget

Pull requests are highly encouraged! Check out CONTRIBUTING.md for guidelines.

---

🤝 Contributing

1. Fork the repo
2. Create your feature branch (git checkout -b feature/amazing-idea)
3. Commit your changes (git commit -m 'Add amazing idea')
4. Push to the branch (git push origin feature/amazing-idea)
5. Open a Pull Request

---

📜 License

This project is open source under the MIT License.
You are free to use, modify, and distribute it – see the license file for details.

---

❤️ Acknowledgements

· spotdl – Spotify metadata & downloading
· yt-dlp – the backbone of all downloads
· mpv – lightweight, terminal media player
· Termux – a real Linux environment for Android

---

🎧 Happy offline listening – in the terminal!

```
