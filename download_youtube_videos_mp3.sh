#!/bin/bash

input_file="video_links.txt"

if [ ! -f "$input_file" ]; then
  echo "Error: $input_file not found."
  exit 1
fi

if ! command -v yt-dlp &> /dev/null; then
  echo "yt-dlp not found, installing..."
  sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
  sudo chmod a+rx /usr/local/bin/yt-dlp
fi

while read -r video_url; do
  if [ -n "$video_url" ]; then
    echo "Downloading: $video_url"
    yt-dlp -f 'bestaudio[ext=m4a]/bestaudio' --extract-audio --audio-format mp3 --add-metadata "$video_url"
  fi
done < "$input_file"

echo "Download complete."
