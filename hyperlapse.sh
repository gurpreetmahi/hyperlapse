#/bin/bash

imagesequence=0

day_start_time=10
day_start_min=48

current_time=0

update_imagesequence () {
	imagesequence=$((imagesequence+1))
}

is_day (){

	day_start_time=$(date +%s -d $(date +'%a %e %b 10:30:00 IST %Y'))
	day_end_time=$(date +%s -d $(date +'%a %e %b 19:30:00 IST %Y'))
	current_time=$(date +%s)

	if [ $current_time -ge day_start_time -a $current_time -le day_end_time ]
	then
		return 0
	else
		return 1
	fi

}

while true
do
	if is_day
	then
		update_imagesequence
		echo $imagesequence
		echo $(date +'%H %M')
		echo $is_day
	else
		echo "Waiting for day"
	fi
	sleep 10
done

