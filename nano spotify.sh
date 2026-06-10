#!/bin/bash

MUSIC_DIR="$HOME/music"
PLAYLIST="$HOME/playlist.txt"

mkdir -p "$MUSIC_DIR"
touch "$PLAYLIST"


function menu() {
  clear
  echo "=============================="
  echo " TERMUX MUSIC CLI PLAYER "
  echo "=============================="
  echo "1) Add local song"
  echo "2) Search & download song (YouTube)"
  echo "3) View playlist"
  echo "4) Play playlist"
  echo "5) Shuffle play"
  echo "6) Repeat playlist (loop)"
  echo "7) Clear playlist"
  echo "8) Exit"
  echo "=============================="
  echo -n "Choose option: "
}


function add_song() {
  echo ""
  echo "Enter full path of song:"
  read song

  if [ -f "$song" ]; then
    echo "$song" >> "$PLAYLIST"
    echo "Added"
  else
    echo "File not found"
  fi
  sleep 1
}

function search_download() {
  echo ""
  echo -n "Enter song name: "
  read query

  yt-dlp -x --audio-format mp3 "ytsearch:$query" -o "$MUSIC_DIR/%(title)s.%(ext)s"

  if [ $? -eq 0 ]; then
    FILE=$(ls -t "$MUSIC_DIR" | head -n 1)
    echo "$MUSIC_DIR/$FILE" >> "$PLAYLIST"
    echo "Downloaded and added"
  else
    echo "Download failed"
  fi

  sleep 1
}

function view_playlist() {
  echo ""
  echo "Playlist:"
  cat "$PLAYLIST"
  echo ""
  read -p "Press Enter..."
}

function play_playlist() {
  while IFS= read -r song; do
    [ -z "$song" ] && continue

    echo "Now Playing: $(basename "$song")"

    if [ -f "$song" ]; then
      mpv "$song"
    else
      echo "Missing: $song"
    fi
  done < "$PLAYLIST"
}

function shuffle_play() {
  shuf "$PLAYLIST" | while IFS= read -r song; do
    [ -z "$song" ] && continue

    echo "Now Playing: $(basename "$song")"

    if [ -f "$song" ]; then
      mpv "$song"
    fi
  done
}

function repeat_play() {
  while true; do
    play_playlist
  done
}

function clear_playlist() {
  > "$PLAYLIST"
  echo "Playlist cleared"
  sleep 1
}

while true; do
  menu
  read choice

  case $choice in
    1) add_song ;;
    2) search_download ;;
    3) view_playlist ;;
    4) play_playlist ;;
    5) shuffle_play ;;
    6) repeat_play ;;
    7) clear_playlist ;;
    8) exit ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
done



#lol took me almost 8-10 hrs
