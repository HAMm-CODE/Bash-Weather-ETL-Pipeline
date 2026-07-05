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

# To extract the forecast tempearature for noon tomorrow
fc_temp=$(curl -s wttr.in/$city?T | head -23 | tail -1 | grep '°.' | cut -d 'C' -f2 | grep -Eo -e '-?[[:digit:]].*')
echo "The forecasted temperature for noon tomorrow for $city : $fc_temp C"

#The first line uses a combination of head and tail to narrow down to the line containing tomorrow's noon forecast temperature. grep and cut are employed to isolate and format 
#the temperature information, and, the numeric part of the temperature is captured using grep -Eo.
