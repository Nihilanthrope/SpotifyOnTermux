I have compiled all your requirements into a single, high-end, and comprehensive `README.md`. This version is specifically optimized for Termux users, handles the technical nuances of `spotdl` on Android, and maintains the professional anime aesthetic you requested.

```markdown
# 🎵 Termux Spotify Downloader & Music Player 🎧

<div align="center">

<img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNHIxZ2Z4Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5JmVwPXYxX2ludGVybmFsX2dpZl9ieV9pZCZjdD1n/iyUSIv2mZ5wj/giphy.gif" width="100%" alt="Anime Music Aesthetic" />

**A hybrid CLI music tool for Android, bringing a Spotify-like experience to your terminal.**

[![Termux](https://img.shields.io/badge/Platform-Termux-black?style=for-the-badge&logo=android)](https://termux.dev)
[![Python](https://img.shields.io/badge/Python-3.8+-blue?style=for-the-badge&logo=python)](https://python.org)
[![License](https://img.shields.io/badge/License-Free-green?style=for-the-badge)](#-license)

</div>

---

## 🎬 Demo

<div align="center">

**Searching & Downloading Tracks**
![yt-dlp download demo](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNHIxZ2Z4Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5JmVwPXYxX2ludGVybmFsX2dpZl9ieV9pZCZjdD1n/yZ05HKEqinmI/giphy.gif)

**High-Fidelity Terminal Playback**
![mpv playback demo](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNHIxZ2Z4Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5Z3R5JmVwPXYxX2ludGVybmFsX2dpZl9ieV9pZCZjdD1n/HA1S3SmlQcnm/giphy.gif)

</div>

---

## ✨ Features

- 🟢 **Spotify-style Search:** Search by song name or paste Spotify links (via `spotdl`).
- 🔴 **YouTube Fallback:** Rock-solid `yt-dlp` search when Spotify tools are unstable.
- 📥 **MP3 Support:** High-quality audio extraction with automatic metadata handling.
- 🔊 **mpv Integration:** Lightweight, keyboard-driven playback with volume control.
- 📶 **Offline First:** Download once, listen anywhere without an internet connection.
- 💻 **Pure CLI:** Built specifically for Termux—no GUI, no ads, no bloat.

---

## 📋 Requirements

To handle native Python builds and media processing, install these Termux packages:

```bash
pkg update && pkg upgrade -y
pkg install python ffmpeg mpv yt-dlp git rust clang make -y
```

> **Note:** `rust`, `clang`, and `make` are essential for compiling native Python dependencies on Android.

---

## 🚀 Installation

### 1. Setup Storage Access
Ensure Termux can save files to your phone's storage:
```bash
termux-setup-storage
```

### 2. (Optional) Install spotdl
If you want Spotify link support, install `spotdl` via pip:
```bash
pip install spotdl
```
*Note: See the Troubleshooting section if this fails.*

---

## 🎯 Usage

### 🎶 Method 1: spotdl (Spotify Links & Names)
Download using a direct Spotify track link:
```bash
spotdl "https://open.spotify.com/track/YOUR_TRACK_ID"
```
Or search by song name:
```bash
spotdl "Bohemian Rhapsody Queen"
```

### 📺 Method 2: yt-dlp (Main Stable Method)
Search and download directly from YouTube:
```bash
yt-dlp "ytsearch:Your Song Name" -x --audio-format mp3 -o "%(title)s.%(ext)s"
```

### 🔊 Playback with mpv
Play a specific file:
```bash
mpv "Song_Name.mp3"
```
Play all songs in the folder with shuffle:
```bash
mpv --shuffle *.mp3
```

---

## 🔁 Example Workflows

### Download and Play Immediately
```bash
yt-dlp "ytsearch:Lose Yourself Eminem" -x --audio-format mp3 -o "%(title)s.%(ext)s" && mpv *.mp3
```

### Simulate Spotify Search via YouTube
Get the most accurate "Official Audio" result:
```bash
yt-dlp "ytsearch1:Blinding Lights The Weeknd official audio" -x --audio-format mp3 -o "%(title)s.%(ext)s"
```

---

## 📁 Output
By default, files are saved in your **current working directory**. 
To save directly to your Android Music folder:
```bash
yt-dlp "ytsearch:Song Name" -x --audio-format mp3 -o "/sdcard/Music/%(title)s.%(ext)s"
```

---

## 🛠️ Troubleshooting

### `spotdl: command not found`
Fix your PATH to include pip's local bin:
```bash
export PATH="$HOME/.local/bin:$PATH"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### spotdl Errors (`tls-client`, `cryptography`)
`spotdl` often breaks on Android due to native ARM dependency issues. 
**Solution:** Use the `yt-dlp` method. It is natively supported and much more stable on Termux.

---

## 📌 Important Notes
- ❌ **NOT an official Spotify API tool.** This tool scrapes metadata and finds matching audio on YouTube.
- ⚠️ **spotdl is unstable on Android.** It is provided as an optional feature.
- ✅ **yt-dlp is the primary method.** Use it for the most reliable experience.

---

## 🔮 Future Improvements
- [ ] **Playlist Support:** Batch download entire Spotify/YouTube playlists.
- [ ] **Terminal UI (TUI):** An interactive menu using `fzf` for song selection.
- [ ] **Lyrics Display:** Fetch and sync lyrics in real-time during playback.
- [ ] **Folder Organization:** Auto-sort by Artist/Album folders.
- [ ] **Live Wallpaper Sync:** Change terminal colors based on the current track's vibe.

---

## 📄 License
This project is **free to use** and open-source. Build it, break it, and share it!

---

<div align="center">

**Built with 🖤 for the Termux Community.**

</div>
```
