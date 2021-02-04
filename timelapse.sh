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
	screen_count=$(cscreen -l | grep -v "[Dd]isplay" | wc -l)
   timestamp=$(date '+%Y-%m-%dT%H%M%S');
   echo "Capturing $screen_count screens at $timestamp"
	all_screens=()
	for (( c=1; c<=$screen_count; c++ )); do
		all_screens+=( "$output_folder/screen/$timestamp-screen-$c.png $screens" );
	done
	screencapture -x ${all_screens[@]};

   # If you have a webcam, you might want to capture that too.
	external_webcam_count=$(imagesnap -l | grep "C920" | wc -l)
	 if [[ $external_webcam_count -eq 1 ]]; then
		echo "Capturing external webcam at $timestamp"
		 imagesnap -d "HD Pro Webcam C920" -q "$output_folder/webcam/$timestamp-webcam.jpg";
	 else
		echo "Capturing built-in webcam at $timestamp"
		 imagesnap "$output_folder/webcam/$timestamp-webcaam.jpg";
	 fi

	 unset screens
   sleep 300;	#	5 mins
done;

# After it's finished, you probably want to play around with image
# magick to stitch the images together and create a movie.
# Specifically look at the tools montage and convert.

