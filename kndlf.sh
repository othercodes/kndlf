
#!/usr/bin/env bash
#
# Small script to convert epub files into mobi files in batch.
#
# Author: Unay Santisteban <slavepens@gmail.com>
# License: MIT
#
# Execution:
#   $ ./knldf.sh
#
# You can also move the script into the /usr/bin directory
#   $ mv knldf.sh /usr/bin/knldf
#   $ chmod +x /usr/bin/knldf
#   $ knldf [-x] [-i]
#
if [ ! -f /usr/bin/kindlegen ]; then
  echo "kindlegen is not installed, please dowload it."
  echo "url: amazon.com/kindleformat/kindlegen"
  exit -1
done

for file in $(find ./ -maxdepth 1 -type f | grep .epub); do
  kindlegen $f -c2 -o ${file/.epub/.mobi};
done
