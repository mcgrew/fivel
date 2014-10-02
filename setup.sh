#!/bin/bash

FIVEL_DIR=$(dirname $0)
echo "Linking files from $FIVEL_DIR..."

mkdir -p js css html img

ln -s ../../$FIVEL_DIR/css/login.css www/css/login.css
ln -s ../../$FIVEL_DIR/css/mobileapp.css www/css/mobileapp.css
ln -s ../../$FIVEL_DIR/html/login.html www/html/login.html
ln -s ../../$FIVEL_DIR/img/active_arrow.png www/img/active_arrow.png
ln -s ../../$FIVEL_DIR/img/active_arrow.svg www/img/active_arrow.svg
ln -s ../../$FIVEL_DIR/img/back_icon.png www/img/back_icon.png
ln -s ../../$FIVEL_DIR/img/back_icon.svg www/img/back_icon.svg
ln -s ../../$FIVEL_DIR/img/home.png www/img/home.png
ln -s ../../$FIVEL_DIR/img/home.svg www/img/home.svg
ln -s ../../$FIVEL_DIR/img/logout.png www/img/logout.png
ln -s ../../$FIVEL_DIR/img/logout.svg www/img/logout.svg
ln -s ../../$FIVEL_DIR/img/menu_icon.png www/img/menu_icon.png
ln -s ../../$FIVEL_DIR/img/menu_icon.svg www/img/menu_icon.svg
ln -s ../../$FIVEL_DIR/img/trash.png www/img/trash.png
ln -s ../../$FIVEL_DIR/img/trash.svg www/img/trash.svg
ln -s ../../$FIVEL_DIR/img/x.png www/img/x.png
ln -s ../../$FIVEL_DIR/img/x.svg www/img/x.svg
ln -s    ../$FIVEL_DIR/index.html www/index.html
ln -s ../../$FIVEL_DIR/js/jquery.min.js www/js/jquery.min.js
ln -s ../../$FIVEL_DIR/js/jquery.mustache.js www/js/jquery.mustache.js
ln -s ../../$FIVEL_DIR/js/mobileapp.js www/js/mobileapp.js
ln -s ../../$FIVEL_DIR/js/legacy.js www/js/legacy.js

# add hooks to handle the symlinks in the www directory.
mkdir -p hooks/before_build hooks/before_run hooks/after_build hooks/after_run
ln -s ../../$FIVEL_DIR/050_before_build.sh hooks/before_build/
ln -s ../../$FIVEL_DIR/050_before_build.sh hooks/before_run/
ln -s ../../$FIVEL_DIR/050_after_build.sh hooks/after_build/
ln -s ../../$FIVEL_DIR/050_after_build.sh hooks/after_run/


echo "Creating/copying other required files..."
touch css/app.css

cp -i $FIVEL_DIR/js/logic.js js/logic.js
cp -i $FIVEL_DIR/css/theme.css css/theme.css
