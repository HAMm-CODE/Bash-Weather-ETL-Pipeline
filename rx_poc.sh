#!/usr/bin/bash

city=Casablanca
curl -s wttr.in/$city?T --output weather_report


#To extract Current Temperature
#curl -s wttr.in/$city?T #get the url contents
#grep -m 1 '°.' #get the frist line that matches this
#grep -Eo -e '-?[[:digit:]].*' #use regex to match temperature

#in one line 
obs_temp=$(curl -s wttr.in/$city?T | grep -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*')
echo "The current Temperature of $city: $obs_temp"
