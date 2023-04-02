#!/bin/bash

expand_tilde() {
  local path="$1"
  printf "%s" "${path/#\~/$HOME}"
}

echo "Enter the desired format (mp3 or mp4):"
read format

if [[ "$format" != "mp3" && "$format" != "mp4" ]]; then
  echo "Invalid format. Please enter either 'mp3' or 'mp4'."
  exit 1
fi

echo "Enter the path to the text file with video links:"
read input_file_raw

input_file=$(expand_tilde "$input_file_raw")

if [ ! -f "$input_file" ]; then
  echo "Error: $input_file not found."
  exit 1
fi

echo "Enter the directory where you'd like to save the downloaded files:"
read output_dir_raw

output_dir=$(expand_tilde "$output_dir_raw")

if [ ! -d "$output_dir" ]; then
  echo "Error: $output_dir not found."
  exit 1
fi

if ! command -v yt-dlp &> /dev/null; then
  echo "yt-dlp not found, installing..."
  sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
  sudo chmod a+rx /usr/local/bin/yt-dlp
fi

if [[ "$format" == "mp3" ]] && ! command -v ffmpeg &> /dev/null; then
  echo "ffmpeg not found. It is required for mp3 conversion. Please install it before proceeding."
  exit 1
fi

while read -r video_url; do
  if [ -n "$video_url" ]; then
    echo "Downloading: $video_url"
    if [ "$format" == "mp4" ]; then
      yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]' --merge-output-format mp4 -o "$output_dir/%(title)s.%(ext)s" "$video_url"
    else
      yt-dlp -f 'bestaudio/best' -x --audio-format mp3 -o "$output_dir/%(title)s.%(ext)s" "$video_url"
    fi
  fi
done < "$input_file"

echo "Download complete."
