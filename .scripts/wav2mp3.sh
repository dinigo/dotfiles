#!/bin/bash
mkdir converted_to_mp3
for f in *.wav; do 
    lame --vbr-new -V 3 "$f" ./converted_to_mp3/"${f%.wav}.mp3";
done
