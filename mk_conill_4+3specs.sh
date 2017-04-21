#!/bin/sh

export IFS=$'\n' ## to allow for spaces in names, ugh...

## If you need to replace something in the original filename, do it in the output_file declaration, with the sed.
process_files()
{	
	hd_tw=1280
	hd_th=720
	input_dir=$input_dir_hd
	f=$input_dir/$1
	output_file=$(basename ${1%.*}|sed s/_1920x1080//)
	ffmpeg -ss $slate_offset -i "$f" \
	-t $time -y -g 7 -s $hd_tw'x'$hd_th -ar 44100 -vcodec libx264 -profile:v main -pix_fmt yuv420p -g 15 -strict -2 "$output_dir/"$output_file"_Version_1.mov" \
	-t $time -y -g 7 -s $hd_tw'x'$hd_th -ar 44100 -vcodec mpeg4 -vb 9600k -strict -2 "$output_dir/"$output_file"_Version_2.mov" \
	-t $time -y -g 7 -s $hd_tw'x'$hd_th -ar 44100 -vcodec mpeg1video -vb 9600k "$output_dir/"$output_file"_Version_3.mpeg" \
	-t $time -y -g 7 -s $hd_tw'x'$hd_th -ar 44100 -vcodec libx264 -profile:v main -pix_fmt yuv420p -g 15 -strict -2 "$output_dir/"$output_file"_Version_4.flv" \
	-t $time -y -g 7 -s $hd_tw'x'$hd_th -vf "setfield=prog" -ar 48000 -vcodec libx264 -profile:v main -level 4 -pix_fmt yuv420p -g 7 -strict -2 -vb 15000k -ab 320k "$output_dir/"$output_file"_Version_HULU_720p.mov" \
	-t $time -y -g 7 -vf "setfield=prog" -ar 48000 -vcodec libx264 -profile:v main -pix_fmt yuv420p -g 7 -strict -2 -vb 15000k "$output_dir/"$output_file"_Version_YOUTUBE.mp4" \
	-t $time -y -g 7 -s 640x360 -ar 44100 -vcodec mpeg4 -vb 1200k -strict -2 "$output_dir/"$output_file"_640x360.mov" \
	
}

#	-t $time -y -g 7 -s $hd_tw'x'$hd_th -ar 44100 -vcodec mpeg4 -vb 9600k -strict -2 "$output_dir/"$output_file"_Version_2.mov" \
#	-t $time -y -g 7 -s $hd_tw'x'$hd_th -ar 44100 -vcodec mpeg1video -vb 9600k "$output_dir/"$output_file"_Version_3.mpeg" \
#	-t $time -y -g 7 -s $hd_tw'x'$hd_th -ar 44100 -vcodec libx264 -profile:v main -pix_fmt yuv420p -g 15 -strict -2 "$output_dir/"$output_file"_Version_4.flv" \
#	-t $time -y -g 7 -s $hd_tw'x'$hd_th -vf "setfield=prog" -ar 48000 -vcodec libx264 -profile:v main -level 4 -pix_fmt yuv420p -g 7 -strict -2 -vb 15000k -ab 320k "$output_dir/"$output_file"_Version_HULU_720p.mov" \
#	-t $time -y -g 7 -vf "setfield=prog" -ar 48000 -vcodec libx264 -profile:v main -pix_fmt yuv420p -g 7 -strict -2 -vb 15000k "$output_dir/"$output_file"_Version_YOUTUBE.mp4" \
#	-t $time -y -g 7 -s 640x360 -ar 44100 -vcodec mpeg4 -vb 1200k -strict -2 "$output_dir/"$output_file"_640x360.mov" \
	
	
# -t $time -y -g 7 -vf "setfield=prog" -ar 48000 -vcodec libx264 -profile:v main -pix_fmt yuv420p -g 7 -strict -2 -vb 25000k -ab 320k  "$output_dir/"$output_file"_Version_HULU.mov" \

for f;
	do	process_files "$f";
done
