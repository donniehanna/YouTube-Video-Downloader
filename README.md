# YouTube-Video-Downloader
Bulk Download Youtube videos as mp3 or mp4 from a list defines in txt file

This repository contains two Bash scripts to download YouTube videos as MP4 (video and audio) or MP3 (audio only) files using `yt-dlp`. The scripts read video URLs from a text file, where each URL is on a separate line.

## Prerequisites

- Python
- Bash (for Linux and macOS) or Git Bash (for Windows)
- yt-dlp (automatically installed by the scripts)
- ffmpeg (required for converting to MP3)

## Scripts

1. `download_youtube_videos_mp4.sh`: Downloads YouTube videos as MP4 files (video and audio).

2. `download_youtube_videos_mp3.sh`: Downloads YouTube videos as MP3 files (audio only).

## Usage

### 1. MP4 Video Downloader

To use the MP4 Video Downloader script, follow these steps:

1. Save the `download_youtube_videos_mp4.sh` script to your desired directory.
2. In the same directory, create a text file named `video_links.txt` with one YouTube video URL per line.
3. Open a terminal, navigate to the directory where the script is saved, and run the script with the command `chmod +x download_youtube_videos_mp4.sh && ./download_youtube_videos_mp4.sh`.
4. The script will download each video as an MP4 file to the current directory.

### 2. MP3 Audio Downloader

To use the MP3 Audio Downloader script, follow these steps:

1. Install ffmpeg on your system if you haven't already. Installation instructions can be found here: https://ffmpeg.org/download.html
2. Save the `download_youtube_videos_mp3.sh` script to your desired directory.
3. In the same directory, create a text file named `video_links.txt` with one YouTube video URL per line.
4. Open a terminal, navigate to the directory where the script is saved, and run the script with the command `chmod +x download_youtube_videos_mp3.sh && ./download_youtube_videos_mp3.sh`.
5. The script will download the audio of each video as an MP3 file to the current directory.

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.
