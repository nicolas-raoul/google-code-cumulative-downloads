#!/bin/sh

# Download HTML
wget -qO downloads.html http://code.google.com/p/cmissync/downloads/list

# Get only the download number
cat downloads.html | tr "\n" " " | sed -e "s/col_5/\n/g" | grep "detail?name" | sed -e "s/    <\/a><\/td>.*//g" | sed -e "s/.* //g" | grep -v "ago" > counts.txt

# Cumulative sum
echo "Cumulative number of downloads:"
cat counts.txt | perl -nle '$sum += $_ } END { print $sum'
