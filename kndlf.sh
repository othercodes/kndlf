#!/usr/bin/env bash
#
# Small script to donwload, install and convert epub files 
# into mobi files in batch mode.
# 
# Author: Unay Santisteban <slavepens@gmail.com>
# License: MIT
#
# Execution:
#   $ ./knldf.sh
#
# You can also move the script into the /usr/bin directory
#   $ mv knldf.sh /usr/local/bin/knldf
#   $ chmod +x /usr/local/bin/knldf
#   $ knldf
#
kindlegen_file="kindlegen_linux_2.6_i386_v2_9.tar.gz"
if [ ! -f /usr/bin/kindlegen ]; then
  if [ ! -f $kindlegen_file ]; then 
    echo "Downloading KindleGen v2.9 for Linux."
    curl -LO "http://kindlegen.s3.amazonaws.com/$kindlegen_file"
  fi
  
  echo "Uncompressing kindlegen."
  tar -zxf $kindlegen_file "kindlegen"

  if [ "$EUID" -ne 0 ]; then
    echo "PermissionError: Unable to move the file to /usr/local/bin Please run as root or with sudo."
    exit -1
  fi

  echo "Installing kindlegen."
  mv kindlegen /usr/local/bin/kindlegen
  chmod +x /usr/local/bin/kindlegen

  echo "Cleaning temp tar.gz file."
  rm -rf $kindlegen_file
fi

for file in $(find ./ -maxdepth 1 -type f | grep .epub); do
  kindlegen $f -c2 -o ${file/.epub/.mobi};
done
