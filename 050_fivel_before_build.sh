#!/bin/bash

if [ ! -e www~ ]; then
  mv www www~
  cp -rL www~ www
fi;

# regenerate icons if necessary
# TODO add platform checking
if [ -f icon.svg -a icon.svg -nt platforms/android/res/drawable-xhdpi/icon.png ] ; then
  which inkscape > /dev/null 2>&1
  INKSCAPE = $?
  if [ $INKSCAPE ]; then
    echo "Inkscape not found, skipping icon updating..."
  else
    echo "Updating Android icons..."
    inkscape -w 96 -h 96 --export-png platforms/android/res/drawable/icon.png icon.svg
    inkscape -w 36 -h 36 --export-png platforms/android/res/drawable-ldpi/icon.png icon.svg
    inkscape -w 96 -h 96 --export-png platforms/android/res/drawable-xhdpi/icon.png icon.svg
    inkscape -w 72 -h 72 --export-png platforms/android/res/drawable-hdpi/icon.png icon.svg
    inkscape -w 48 -h 48 --export-png platforms/android/res/drawable-mdpi/icon.png icon.svg
  fi;
fi;

