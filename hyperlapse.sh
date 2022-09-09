#/bin/bash

imagesequence=0

day_start_time=10
day_start_min=48

current_time=0

update_imagesequence () {
	imagesequence=$((imagesequence+1))
}

is_day (){

	day_start_time=$(date +%s -d '05:30:00')
	day_end_time=$(date +%s -d '19:30:00')
	current_time=$(date +%s)

	if [ $current_time -ge $day_start_time -a $current_time -le $day_end_time ]
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
		pwd
		if [ -d "images/%(date +%d%m%y)" ]; then
			echo exists
		else
			echo "creating directory"
			mkdir -p images/$(date +%d%m%y)	
		fi

		fswebcam --no-banner -r 1920x1080  images/$(date +%d%m%y)/$imagesequence.jpg		
		echo "Taking picture"
	else
		echo "Waiting for day"
	fi
	sleep 10
done

