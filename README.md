\# Weather Forecast Accuracy Tracker



A Bash-based project that collects daily weather data, logs observed and forecasted temperatures, and analyzes forecast accuracy over time.



\## Project Overview



This project demonstrates a simple weather data pipeline using Bash scripting. It collects weather information for Casablanca, extracts the current observed temperature and the forecasted temperature, stores the data in a log file, and calculates how accurate previous forecasts were compared to actual temperatures.



The project also includes weekly statistics to summarize forecast errors.



\## Features



\* Collects weather data from `wttr.in`

\* Extracts observed and forecasted temperatures

\* Stores daily weather records in a tab-delimited log file

\* Calculates forecast accuracy by comparing forecasted and actual temperatures

\* Classifies accuracy as excellent, good, fair, or poor

\* Generates weekly minimum and maximum absolute forecast errors

\* Can be scheduled to run daily using cron



\## Technologies Used



\* Bash

\* Linux command line

\* `curl`

\* `wget`

\* `grep`

\* `cut`

\* `head`

\* `tail`

\* Cron jobs

\* Tab-separated value files



\## Project Files



```text

weather-forecast-accuracy-tracker/



├── rx\_poc.sh

├── fc\_accuracy.sh

├── weekly\_stats.sh

├── rx\_poc.log

├── historical\_fc\_accuracy.tsv

├── synthetic\_historical\_fc\_accuracy.tsv

├── scratch.txt

└── README.md

```



\## File Descriptions



\### `rx\_poc.sh`



This script collects the weather report for Casablanca, extracts the current observed temperature and tomorrow’s forecasted temperature, and appends the result to `rx\_poc.log`.



\### `rx\_poc.log`



This file stores the daily weather records. Each row contains:



```text

year    month    day    obs\_temp    fc\_temp

```



\### `fc\_accuracy.sh`



This script compares yesterday’s forecasted temperature with today’s observed temperature. It calculates the forecast error and assigns an accuracy label.



Accuracy labels:



| Error Range             | Label     |

| ----------------------- | --------- |

| +/- 1 degree            | excellent |

| +/- 2 degrees           | good      |

| +/- 3 degrees           | fair      |

| More than +/- 3 degrees | poor      |



\### `historical\_fc\_accuracy.tsv`



This file stores the historical forecast accuracy results.



Each row contains:



```text

year    month    day    obs\_temp    fc\_temp    accuracy    accuracy\_range

```



\### `weekly\_stats.sh`



This script analyzes the latest seven days of forecast accuracy data and reports the minimum and maximum absolute forecast errors.



\### `synthetic\_historical\_fc\_accuracy.tsv`



This is a sample dataset used to test the weekly forecast accuracy statistics.



\### `scratch.txt`



A temporary file used by `weekly\_stats.sh` when processing the latest weekly accuracy values.



\## How to Run the Project



\### 1. Create the weather log file



```bash

touch rx\_poc.log

echo -e "year\\tmonth\\tday\\tobs\_temp\\tfc\_temp" > rx\_poc.log

```



\### 2. Make the scripts executable



```bash

chmod u+x rx\_poc.sh

chmod u+x fc\_accuracy.sh

chmod u+x weekly\_stats.sh

```



\### 3. Run the weather collection script



```bash

./rx\_poc.sh

```



This will collect the weather data and append it to `rx\_poc.log`.



\### 4. Run the forecast accuracy script



```bash

./fc\_accuracy.sh

```



This will calculate the difference between the forecasted and observed temperatures and append the result to `historical\_fc\_accuracy.tsv`.



\### 5. Run the weekly statistics script



```bash

./weekly\_stats.sh

```



This will calculate the minimum and maximum absolute forecast errors for the latest seven days.



\## Scheduling with Cron



To run the weather collection script automatically every day, open the cron editor:



```bash

crontab -e

```



Then add a cron job similar to this:



```bash

0 6 \* \* \* /home/project/rx\_poc.sh

```



This schedules the script to run once per day.



\## Sample Output



Example row in `rx\_poc.log`:



```text

2026    07    05    25    27 C

```



Example row in `historical\_fc\_accuracy.tsv`:



```text

2026    07    05    25    27    2    good

```



\## Skills Demonstrated



\* Bash scripting

\* Command-line data extraction

\* Simple ETL pipeline development

\* Weather data collection

\* Data logging

\* Forecast accuracy analysis

\* Task automation using cron

\* Basic reporting with TSV files



\## Project Goal



The goal of this project is to practice building a lightweight data pipeline that collects raw weather data, stores structured records, and performs basic analytics to evaluate forecast accuracy.



