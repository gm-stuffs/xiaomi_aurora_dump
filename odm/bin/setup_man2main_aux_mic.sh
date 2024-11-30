# tinyplay file.wav [-D card] [-d device] [-p period_size] [-n n_periods]
# sample usage: playback.sh 2000.wav  1
set -x
sleep 1
echo "enabling main and aux mic"
audio-factory-test -f enable_mainaux-mic
# start recording
agmcap /data/data/man2mainaux_mic_cap.wav -r 48000 -b 16 -c 2 -T 4 -p 1024 -n 4 -D 100 -d 101 -i CODEC_DMA-LPAIF_RXTX-TX-4 && echo "capture done" &
sleep 4
echo "disabling main and aux mic"
audio-factory-test -f disable_mainaux-mic
