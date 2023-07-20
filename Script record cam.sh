#!/bin/bash
rtsp_url="rtsp://user:psswd@ip/additional-link" # Camera RTSP address
output_path="/../$(date +%Y-%m-%d_%H-%M-%S).mp4" # Path of the file where the video will be recorded
capture_options="-rtsp_transport tcp -i $rtsp_url" # Video capture options
codec_options="-c:v libx265 -preset ultrafast -crf 22" # Video encoding options
record_options="-f mp4 -movflags frag_keyframe+empty_moov -vf scale=-1:1080 -r 25 -c:v libx265 -preset ultrafast -crf 22" # Video recording options
video_size="1920x1080" # Video size (in pixels)
ffmpeg $capture_options $codec_options $record_options -video_size $video_size $output_path # Rec
