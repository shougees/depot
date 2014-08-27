define(['es5'], function() {

  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/startsWith
  // WEB-23440 IE7,8 do not support Object.defineProperty, modified shim accordingly
  if (!String.prototype.startsWith) {
    String.prototype.startsWith = function(searchString, position) {
      position = position || 0;
      return this.indexOf(searchString, position) === position;
    };
  }

  // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith
  // WEB-23440 IE7,8 do not support Object.defineProperty, modified shim accordingly
  if (!String.prototype.endsWith) {
    String.prototype.endsWith = function(searchString, position) {
      position = position || this.length;
      position = position - searchString.length;
      var lastIndex = this.lastIndexOf(searchString);
      return lastIndex !== -1 && lastIndex === position;
    };
  }

});
