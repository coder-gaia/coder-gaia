#!/bin/bash

total_days=365

for i in $(seq 1 $total_days); do
  date=$(date --date="$i days ago" +"%Y-%m-%d")

  echo "$date" > "commit.md"

  GIT_AUTHOR_DATE="$date 12:00:00" GIT_COMMITTER_DATE="$date 12:00:00" git add commit.md
  GIT_AUTHOR_DATE="$date 12:00:00" GIT_COMMITTER_DATE="$date 12:00:00" git commit -m "Snake game $date"

  rm commit.md
done

git push origin main
