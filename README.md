# Weather Forecast Accuracy Tracker

A Bash-based project that collects daily weather data, logs observed and forecasted temperatures, and analyzes forecast accuracy over time.

## Project Overview

This project demonstrates a simple weather data pipeline using Bash scripting. It collects weather information for Casablanca, extracts the current observed temperature and the forecasted temperature, stores the data in a log file, and calculates how accurate previous forecasts were compared to actual temperatures.

The project also includes weekly statistics to summarize forecast errors.

## Features

* Collects weather data from `wttr.in`
* Extracts observed and forecasted temperatures
* Stores daily weather records in a tab-delimited log file
* Calculates forecast accuracy by comparing forecasted and actual temperatures
* Classifies accuracy as excellent, good, fair, or poor
* Generates weekly minimum and maximum absolute forecast errors
* Can be scheduled to run daily using cron

## Technologies Used

* Bash
* Linux command line
* `curl`
* `wget`
* `grep`
* `cut`
* `head`
* `tail`
* Cron jobs
* Tab-separated value files

## Project Files

```text
weather-forecast-accuracy-tracker/

├── rx_poc.sh
├── fc_accuracy.sh
├── weekly_stats.sh
├── rx_poc.log
├── historical_fc_accuracy.tsv
├── synthetic_historical_fc_accuracy.tsv
├── scratch.txt
└── README.md
```

## File Descriptions

### `rx_poc.sh`

This script collects the weather report for Casablanca, extracts the current observed temperature and tomorrow’s forecasted temperature, and appends the result to `rx_poc.log`.

### `rx_poc.log`

This file stores the daily weather records. Each row contains:

```text
year    month    day    obs_temp    fc_temp
```

### `fc_accuracy.sh`

This script compares yesterday’s forecasted temperature with today’s observed temperature. It calculates the forecast error and assigns an accuracy label.

Accuracy labels:

| Error Range             | Label     |
| ----------------------- | --------- |
| +/- 1 degree            | excellent |
| +/- 2 degrees           | good      |
| +/- 3 degrees           | fair      |
| More than +/- 3 degrees | poor      |

### `historical_fc_accuracy.tsv`

This file stores the historical forecast accuracy results.

Each row contains:

```text
year    month    day    obs_temp    fc_temp    accuracy    accuracy_range
```

### `weekly_stats.sh`

This script analyzes the latest seven days of forecast accuracy data and reports the minimum and maximum absolute forecast errors.

### `synthetic_historical_fc_accuracy.tsv`

This is a sample dataset used to test the weekly forecast accuracy statistics.

### `scratch.txt`

A temporary file used by `weekly_stats.sh` when processing the latest weekly accuracy values.

## How to Run the Project

### 1. Create the weather log file

```bash
touch rx_poc.log
echo -e "year\tmonth\tday\tobs_temp\tfc_temp" > rx_poc.log
```

### 2. Make the scripts executable

```bash
chmod u+x rx_poc.sh
chmod u+x fc_accuracy.sh
chmod u+x weekly_stats.sh
```

### 3. Run the weather collection script

```bash
./rx_poc.sh
```

This will collect the weather data and append it to `rx_poc.log`.

### 4. Run the forecast accuracy script

```bash
./fc_accuracy.sh
```

This will calculate the difference between the forecasted and observed temperatures and append the result to `historical_fc_accuracy.tsv`.

### 5. Run the weekly statistics script

```bash
./weekly_stats.sh
```

This will calculate the minimum and maximum absolute forecast errors for the latest seven days.

## Scheduling with Cron

To run the weather collection script automatically every day, open the cron editor:

```bash
crontab -e
```

Then add a cron job similar to this:

```bash
0 6 * * * /home/project/rx_poc.sh
```

This schedules the script to run once per day.

## Sample Output

Example row in `rx_poc.log`:

```text
2026    07    05    25    27 C
```

Example row in `historical_fc_accuracy.tsv`:

```text
2026    07    05    25    27    2    good
```

## Skills Demonstrated

* Bash scripting
* Command-line data extraction
* Simple ETL pipeline development
* Weather data collection
* Data logging
* Forecast accuracy analysis
* Task automation using cron
* Basic reporting with TSV files

## Project Goal

The goal of this project is to practice building a lightweight data pipeline that collects raw weather data, stores structured records, and performs basic analytics to evaluate forecast accuracy.
