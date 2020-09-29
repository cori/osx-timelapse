#!/bin/bash
# timelapse
#
# Records a sequence of screencaptures at regular intervals on
# Mac OS X.
#
# Can also record using webcam via the imagesnap program.
#

output_folder="$HOME/OneDrive/Archive/timelapse_output"
while true; do
    timestamp=$(date '+%Y-%m-%dT%H%M%S');
    echo "Capturing screen at $timestamp."
    # For one screen:
    screencapture -t jpg -x "$output_folder/screen/screen1-$timestamp.jpg";
    # For two screens:
    # screencapture -x "$output_folder/screen/screen1-$timestamp.png" "$output_folder/screen/screen2-$timestamp.png";

    # If you have a webcam, you might want to capture that too.
    echo "Capturing isight at $timestamp."
    imagesnap -q "$output_folder/webcam/webcam-$timestamp.jpg";
    # sleep 60;
    sleep 300;	#	5 mins
done;

# After it's finished, you probably want to play around with image
# magick to stitch the images together and create a movie.
# Specifically look at the tools montage and convert.

