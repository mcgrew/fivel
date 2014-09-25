#!/bin/bash

FIVEL_DIR=$(dirname $0)
echo "Linking files from $FIVEL_DIR..."

mkdir -p js css html img

ln -s $FIVEL_DIR/index.html index.html
ln -s $FIVEL_DIR/css/login.css css/login.css
ln -s $FIVEL_DIR/css/mobileapp.css css/mobileapp.css
ln -s $FIVEL_DIR/html/login.html html/login.html
ln -s $FIVEL_DIR/img/active_arrow.svg img/active_arrow.svg
ln -s $FIVEL_DIR/img/back_icon.svg img/back_icon.svg
ln -s $FIVEL_DIR/img/home.svg img/home.svg
ln -s $FIVEL_DIR/img/logout.svg img/logout.svg
ln -s $FIVEL_DIR/img/menu_icon.svg img/menu_icon.svg
ln -s $FIVEL_DIR/js/jquery.min.js js/jquery.min.js
ln -s $FIVEL_DIR/js/jquery.mustache.js js/jquery.mustache.js
ln -s $FIVEL_DIR/js/mobileapp.js js/mobileapp.js


echo "Creating/copying other required files..."
touch css/app.css

cp $FIVEL_DIR/js/logic.js js/logic.js
cp $FIVEL_DIR/css/theme.css css/theme.css
