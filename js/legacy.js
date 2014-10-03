/**
 * This file enables legacy mode - replacing svg images with png images in the 
 * Action Barand Main Menu. This requires that all svg images have a png 
 * counterpart. 
 * This is required since Android 2.x webkit does not support svg images.
 *
 * png images can be generated using inkscape from the command line: 
 * $ inkscape home.svg --export-png home.png
 */

/**
 * Enables legacy mode for the entire app
 */
MobileApp.prototype.legacy = function() {
  this.legacyMode = true;
  this.menu.legacy();
  this.actionBar.legacy()
  var topng = function() {
    this.content.find('img[src$=".svg"]').each(function() { 
      this.src = this.src.replace(/.svg$/, '.png')
    });
  }
  this.on('contentLoaded', topng);
}


/**
 * Enables legacy mode for the ActionBar
 */
ActionBar.prototype.legacy = function() {
  this.legacyMode = true;
  for (var i in this.buttons) {
      this.buttons[i].icon = this.buttons[i].icon.replace(/\.svg$/, '.png')
  }
  this.container.find('img[src$=".svg"]').each(function() { 
    this.src = this.src.replace(/.svg$/, '.png')
  });
}

/**
 * Enables legacy mode for the MainMenu
 */
MainMenu.prototype.legacy = function() {
  this.legacyMode = true;
  for (var i in this.buttons) {
      this.items[i].icon = this.items[i].icon.replace(/\.svg$/, '.png')
  }
  this.container.find('img[src$=".svg"]').each(function() { 
    this.src = this.src.replace(/.svg$/, '.png')
  });
}


// Override this method to watch for svg files
ActionBar.prototype.$addButton = ActionBar.prototype.addButton;
ActionBar.prototype.addButton = function(options) {
    if (this.legacyMode) {
      options.icon = options.icon.replace(/\.svg$/, '.png')
    }
    this.$addButton(options);
}

// Override this method to watch for svg files
MainMenu.prototype.$add = MainMenu.prototype.add;
MainMenu.prototype.add = function(options) {
  if (options.icon && this.legacyMode) { // For Android 2.x
    options.icon.url = options.icon.url.replace(/.svg$/, '.png')
  }
  this.$add(options);
}


