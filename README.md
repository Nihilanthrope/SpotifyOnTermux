<div align="center">

# 🎵 Termux Spotify Downloader & Music Player

**A Spotify-like music experience, right in your terminal — on Android.**

Download songs from YouTube or Spotify links and play them offline using `mpv` — no GUI, no ads, no nonsense.

[![Made for Termux](https://img.shields.io/badge/Made%20for-Termux-black?style=flat-square&logo=android&logoColor=white)](https://termux.dev)
[![Python](https://img.shields.io/badge/Python-3.8+-blue?style=flat-square&logo=python&logoColor=white)](https://python.org)
[![yt-dlp](https://img.shields.io/badge/Powered%20by-yt--dlp-red?style=flat-square)](https://github.com/yt-dlp/yt-dlp)
[![License: Free](https://img.shields.io/badge/License-Free%20to%20Use-green?style=flat-square)](#-license)

</div>

---

## 🎬 Demo

> Watch it in action — search, download, and play music straight from the Termux CLI.

<div align="center">

**Downloading a song via yt-dlp**

![yt-dlp download demo](https://media.giphy.com/media/3o7TKSjRrfIPjeiVyM/giphy.gif)

**Playing music with mpv in Termux**

![mpv playback demo](https://media.giphy.com/media/xT9IgzoKnwFNmISR8I/giphy.gif)

> 📌 *Replace these GIFs with your own screen recordings using [termux-share](https://wiki.termux.com/wiki/Termux:API) or a screen recorder app.*

</div>

---

## ✨ Features

| Feature | Status | Method |
|---|---|---|
| 🎵 Spotify link download | ⚠️ Optional | `spotdl` |
| 🔍 YouTube song search | ✅ Stable | `yt-dlp ytsearch` |
| 📥 MP3 extraction | ✅ Stable | `yt-dlp + ffmpeg` |
| 🔊 Music playback | ✅ Stable | `mpv` |
| 📶 Offline playback | ✅ Stable | Local MP3 files |
| 💻 CLI-only (no GUI) | ✅ | Pure Termux |

- **Spotify-style search** — search by song name or paste a Spotify link (via `spotdl`, optional)
- **YouTube fallback** — rock-solid search using `yt-dlp ytsearch:` — works even when spotdl breaks
- **MP3 downloads** — extract clean audio with `ffmpeg` under the hood
- **mpv playback** — lightweight, keyboard-controlled audio player in the terminal
- **Offline support** — files are saved locally; play them anytime without internet
- **Pure CLI** — no GUI required, built entirely for Termux on Android

---

## 📋 Requirements

### Termux Packages

Install all required packages in one shot:

```bash
pkg update && pkg upgrade -y
pkg install python ffmpeg mpv yt-dlp git rust clang make -y
```

> 💡 `rust` and `clang` are needed to build Python packages like `spotdl` that have native dependencies.

### Python pip

```bash
pip install --upgrade pip
```

---

## 🚀 Installation

### Step 1 — Set up Termux storage access

```bash
termux-setup-storage
```

### Step 2 — Clone this repository

```bash
git clone https://github.com/Nihilanthrope/SpotifyOnTermux.git
cd SpotifyOnTermux
```

### Step 3 — (Optional) Install spotdl

> ⚠️ `spotdl` is **optional**. It may fail on Android due to native dependency issues (`tls-client`, `cryptography`, etc.). If it breaks, use the `yt-dlp` method instead — it's the primary stable method.

```bash
pip install spotdl
```

If `spotdl` isn't found after install, fix your PATH:

```bash
export PATH="$HOME/.local/bin:$PATH"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

---

## 🎯 Usage

### 🎶 Method 1 — spotdl (Spotify link or song name)

Download via a direct Spotify track link:

```bash
spotdl "https://open.spotify.com/track/YOUR_TRACK_ID"
```

Download by song name (spotdl searches internally):

```bash
spotdl "Bohemian Rhapsody Queen"
```

> ⚠️ This method is **not using the official Spotify API**. It scrapes metadata and finds the audio on YouTube. It may break at any time.

---

### 📺 Method 2 — yt-dlp YouTube search (recommended)

Search and download by song name using YouTube search:

```bash
yt-dlp "ytsearch:Bohemian Rhapsody Queen" -x --audio-format mp3 -o "%(title)s.%(ext)s"
```

Download from a direct YouTube URL:

```bash
yt-dlp "https://www.youtube.com/watch?v=fJ9rUzIMcZQ" -x --audio-format mp3 -o "%(title)s.%(ext)s"
```

---

### 🔊 Method 3 — Play a downloaded MP3 with mpv

```bash
mpv "Bohemian Rhapsody.mp3"
```

Play all MP3s in the current folder:

```bash
mpv *.mp3
```

Shuffle playback:

```bash
mpv --shuffle *.mp3
```

---

## 🔁 Example Workflows

### ▶️ Download and play in one command

```bash
yt-dlp "ytsearch:Lose Yourself Eminem" -x --audio-format mp3 -o "%(title)s.%(ext)s" && mpv *.mp3
```

### 🔍 Spotify-style search simulation using yt-dlp

Can't use real Spotify search? Simulate it — search by artist + title:

```bash
# Search for top result and download it
yt-dlp "ytsearch1:Blinding Lights The Weeknd official audio" \
  -x --audio-format mp3 \
  -o "%(title)s.%(ext)s"
```

> `ytsearch1:` fetches only the top result. Use `ytsearch3:` to grab the top 3.

### 📂 Download an entire YouTube playlist as MP3

```bash
yt-dlp -x --audio-format mp3 \
  -o "%(playlist_index)s - %(title)s.%(ext)s" \
  "https://www.youtube.com/playlist?list=YOUR_PLAYLIST_ID"
```

---

## 📁 Output

Downloaded files are saved in the **current working directory** by default.

To save directly to your phone's music folder:

```bash
yt-dlp "ytsearch:Song Name Artist" \
  -x --audio-format mp3 \
  -o "/sdcard/Music/%(title)s.%(ext)s"
```

> 💡 Make sure you've run `termux-setup-storage` first so Termux can write to `/sdcard/`.

---

## 🛠️ Troubleshooting

### `spotdl: command not found`

Your PATH doesn't include pip's local bin. Fix:

```bash
export PATH="$HOME/.local/bin:$PATH"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

---

### `spotdl` fails with dependency errors (`tls-client`, `cffi`, etc.)

This is a known issue on Android/Termux. Some native packages fail to compile on ARM.

**Fix:** Skip spotdl entirely and use the `yt-dlp` fallback method. It's more stable and works natively on Android.

---

### `yt-dlp` not found after `pkg install`

Try installing via pip instead:

```bash
pip install yt-dlp
```

Or update the pkg version:

```bash
pkg install yt-dlp --reinstall
```

---

### `mpv` has no audio output

Termux needs audio permissions. Make sure you've granted microphone/audio permissions to Termux in Android settings, or install [Termux:API](https://f-droid.org/en/packages/com.termux.api/):

```bash
pkg install termux-api
```

---

### `ffmpeg` not found (audio extraction fails)

```bash
pkg install ffmpeg
```

---

## 📌 Important Notes

> Please read before using.

- ❌ **This tool does NOT use the official Spotify API.** Spotify's API does not allow audio downloads.
- ⚠️ **`spotdl` is optional and unstable on Android.** It works by scraping Spotify metadata and finding matching audio on YouTube. It can break when Spotify or YouTube changes their structure.
- ✅ **`yt-dlp` is the primary, stable method.** It directly searches and downloads from YouTube and is actively maintained.
- 📦 All downloads are stored locally. Once downloaded, no internet connection is needed for playback.
- 🔒 Use responsibly. Respect copyright laws in your region.

---

## 🔮 Future Improvements

Things on the roadmap (contributions welcome):

- [ ] 🎼 **Playlist support** — download and auto-queue entire playlists
- [ ] 🖥️ **Terminal UI menu** — `fzf` or `whiptail` based interactive song picker
- [ ] 📝 **Lyrics display** — fetch and display synced lyrics via `lyrics.ovh` or similar free APIs
- [ ] 📁 **Auto folder organization** — sort downloads by artist/album automatically
- [ ] 🎨 **Live wallpaper sync** — change Termux color scheme based on now-playing song (using `termux-wallpaper`)
- [ ] 🔄 **Auto-update checker** — notify when `yt-dlp` has a new version available

---

## 📄 License

This project is **free to use**. No restrictions. Do whatever you want with it.

If you found it useful, drop a ⭐ on the repo — it helps.

---

<div align="center">

Built with 🖤 for Termux users who want music without the bloat.

**[GitHub](https://github.com/Nihilanthrope/SpotifyOnTermux)** • **[Report an Issue](https://github.com/Nihilanthrope/SpotifyOnTermux/issues)** • **[Contribute](https://github.com/Nihilanthrope/SpotifyOnTermux/pulls)**

</div>
