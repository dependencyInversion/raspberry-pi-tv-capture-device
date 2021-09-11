#!/bin/bash

ffmpeg -f v4l2 -thread_queue_size 384 -input_format mjpeg -framerate 30 -i /dev/video0 -f alsa -thread_queue_size 4096 -i plughw:1,0 -acodec pcm_s16le -ac 1 -ar 96000 -copytb 1 -use_wallclock_as_timestamps 1  -c:a aac  -b:a 128k -ar 44100 -b:v 4M -c:v h264_omx -f flv vid_720p_60.avi
