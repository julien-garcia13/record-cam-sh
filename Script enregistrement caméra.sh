#!/bin/bash
rtsp_url="rtsp://utilisateur:motdepasse@adresseip/lien-supplementaire" # Adresse RTSP de la caméra
output_path="/../$(date +%Y-%m-%d_%H-%M-%S).mp4" # Chemin du fichier où la vidéo sera enregistrée
capture_options="-rtsp_transport tcp -i $rtsp_url" # Options de capture vidéo
codec_options="-c:v libx265 -preset ultrafast -crf 22" # Options d'encodage vidéo
record_options="-f mp4 -movflags frag_keyframe+empty_moov -vf scale=-1:1080 -r 25 -c:v libx265 -preset ultrafast -crf 22" # Options d'enregistrement vidéo
video_size="1920x1080" # Taille de la vidéo (en pixels)
ffmpeg $capture_options $codec_options $record_options -video_size $video_size $output_path # Enregistrement de la vidéo