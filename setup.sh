#!/bin/bash

FIVEL_DIR=$(dirname $0)
echo "Linking files from $FIVEL_DIR..."

mkdir -p js css html img

ln -s ../$FIVEL_DIR/css/login.css css/login.css
ln -s ../$FIVEL_DIR/css/mobileapp.css css/mobileapp.css
ln -s ../$FIVEL_DIR/html/login.html html/login.html
ln -s ../$FIVEL_DIR/img/active_arrow.png img/active_arrow.png
ln -s ../$FIVEL_DIR/img/active_arrow.svg img/active_arrow.svg
ln -s ../$FIVEL_DIR/img/back_icon.png img/back_icon.png
ln -s ../$FIVEL_DIR/img/back_icon.svg img/back_icon.svg
ln -s ../$FIVEL_DIR/img/home.png img/home.png
ln -s ../$FIVEL_DIR/img/home.svg img/home.svg
ln -s ../$FIVEL_DIR/img/logout.png img/logout.png
ln -s ../$FIVEL_DIR/img/logout.svg img/logout.svg
ln -s ../$FIVEL_DIR/img/menu_icon.png img/menu_icon.png
ln -s ../$FIVEL_DIR/img/menu_icon.svg img/menu_icon.svg
ln -s ../$FIVEL_DIR/img/trash.png img/trash.png
ln -s ../$FIVEL_DIR/img/trash.svg img/trash.svg
ln -s ../$FIVEL_DIR/img/x.png img/x.png
ln -s ../$FIVEL_DIR/img/x.svg img/x.svg
ln -s    $FIVEL_DIR/index.html index.html
ln -s ../$FIVEL_DIR/js/jquery.min.js js/jquery.min.js
ln -s ../$FIVEL_DIR/js/jquery.mustache.js js/jquery.mustache.js
ln -s ../$FIVEL_DIR/js/mobileapp.js js/mobileapp.js


echo "Creating/copying other required files..."
touch css/app.css

cp -i $FIVEL_DIR/js/logic.js js/logic.js
cp -i $FIVEL_DIR/css/theme.css css/theme.css
