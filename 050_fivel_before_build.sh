#!/bin/bash

if [ ! -e www~ ]; then
  mv www www~
  # OSX needs capital R for recursive. Does this work on Linux too?
  cp -rL www~ www || cp -RL www~ www
fi;

# regenerate icons if necessary
if [ -f icon.svg ] ; then
  INKSCAPE=$(which inkscape > /dev/null 2>&1)
  NOTINPATH=$?
  if [ $NOTINPATH -ne 0 -a -e "/Applications/Inkscape.app/Contents/Resources/bin/inkscape" ]; then
    # inkscape path for OSX
    INKSCAPE="/Applications/Inkscape.app/Contents/Resources/bin/inkscape"
    NOTINPATH=0
  fi;
  if [ $NOTINPATH -ne 0 ]; then
    echo "Inkscape not found, skipping icon updating..."
  else
    echo $CORDOVA_PLATFORMS | tr ", " \\r\\n | while read i; do 
      case "$i" in 
        android)
          if [ icon.svg -nt platforms/android/res/drawable-xhdpi/icon.png ]; then
            echo "Updating Android icons..."
            $INKSCAPE -w  96 -h  96 --export-png platforms/android/res/drawable/icon.png icon.svg
            $INKSCAPE -w  36 -h  36 --export-png platforms/android/res/drawable-ldpi/icon.png icon.svg
            $INKSCAPE -w  96 -h  96 --export-png platforms/android/res/drawable-xhdpi/icon.png icon.svg
            $INKSCAPE -w  72 -h  72 --export-png platforms/android/res/drawable-hdpi/icon.png icon.svg
            $INKSCAPE -w  48 -h  48 --export-png platforms/android/res/drawable-mdpi/icon.png icon.svg
          fi;
          ;;
        ios)
          RESOURCE_DIR=$(ls -d platforms/ios/*/Resources)
          if [ ! -z "$RESOURCE_DIR" -a icon.svg -nt $IOS_DIR/icons/icon.png ]; then
            echo "Updating iOS icons..."
            $INKSCAPE -w  40 -h  40 --export-png $RESOURCE_DIR/icons/icon-40.png icon.svg
            $INKSCAPE -w  80 -h  80 --export-png $RESOURCE_DIR/icons/icon-40@2x.png icon.svg
            $INKSCAPE -w  50 -h  50 --export-png $RESOURCE_DIR/icons/icon-50.png icon.svg
            $INKSCAPE -w 100 -h 100 --export-png $RESOURCE_DIR/icons/icon-50@2x.png icon.svg
            $INKSCAPE -w  60 -h  60 --export-png $RESOURCE_DIR/icons/icon-60.png icon.svg
            $INKSCAPE -w 120 -h 120 --export-png $RESOURCE_DIR/icons/icon-60@2x.png icon.svg
            $INKSCAPE -w  72 -h  72 --export-png $RESOURCE_DIR/icons/icon-72.png icon.svg
            $INKSCAPE -w 144 -h 144 --export-png $RESOURCE_DIR/icons/icon-72@2x.png icon.svg
            $INKSCAPE -w  76 -h  76 --export-png $RESOURCE_DIR/icons/icon-76.png icon.svg
            $INKSCAPE -w 152 -h 152 --export-png $RESOURCE_DIR/icons/icon-76@2x.png icon.svg
            $INKSCAPE -w  29 -h  29 --export-png $RESOURCE_DIR/icons/icon-small.png icon.svg
            $INKSCAPE -w  58 -h  58 --export-png $RESOURCE_DIR/icons/icon-small@2x.png icon.svg
            $INKSCAPE -w  57 -h  57 --export-png $RESOURCE_DIR/icons/icon.png icon.svg
            $INKSCAPE -w 114 -h 114 --export-png $RESOURCE_DIR/icons/icon@2x.png icon.svg
          fi;
          if [ ! -z "$RESOURCE_DIR" -a -e splash.svg -a splash.svg -nt $IOS_DIR/splash/Default~iphone.png ]; then
            $INKSCAPE -w  640 -h 1136 --export-png $RESOURCE_DIR/splash/Default-568h@2x~iphone.png
            $INKSCAPE -w 2048 -h 1536 --export-png $RESOURCE_DIR/splash/Default-Landscape@2x~ipad.png
            $INKSCAPE -w 1024 -h  768 --export-png $RESOURCE_DIR/splash/Default-Landscape~ipad.png
            $INKSCAPE -w 1536 -h 2048 --export-png $RESOURCE_DIR/splash/Default-Portrait@2x~ipad.png
            $INKSCAPE -w  768 -h 1024 --export-png $RESOURCE_DIR/splash/Default-Portrait~ipad.png
            $INKSCAPE -w  640 -h  960 --export-png $RESOURCE_DIR/splash/Default@2x~iphone.png
            $INKSCAPE -w  320 -h  480 --export-png $RESOURCE_DIR/splash/Default~iphone.png
          fi;
          ;;
      esac;
    done;
  fi;
fi;

