// pull in desired CSS/SASS files
require( './styles/main.scss' );
// var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js' );           // <--- remove if jQuery not needed
// require( '../../node_modules/bootstrap-sass/assets/javascripts/bootstrap.js' );   // <--- remove if Bootstrap's JS not needed 

var addEvent = (function () {
  if (document.addEventListener) {
    return function (el, type, fn) {
      if (el && el.nodeName || el === window) {
        el.addEventListener(type, fn, false);
      } else if (el && el.length) {
        for (var i = 0; i < el.length; i++) {
          addEvent(el[i], type, fn);
        }
      }
    };
  } else {
    return function (el, type, fn) {
      if (el && el.nodeName || el === window) {
        el.attachEvent('on' + type, function () { return fn.call(el, window.event); });
      } else if (el && el.length) {
        for (var i = 0; i < el.length; i++) {
          addEvent(el[i], type, fn);
        }
      }
    };
  }
})();

// inject bundled Elm app into div#main
var Elm = require( '../elm/Main' );
var mainNode = document.getElementById( 'main' );
var user = localStorage.getItem('elm-conduit-user');
var user = user ? JSON.parse(user) : "{}";
var app = Elm.Main.embed(mainNode, user);

app.ports.saveUser.subscribe(function(user) {
    localStorage.setItem('elm-conduit-user', JSON.stringify(user));
});

addEvent(window, 'storage', function (event) {
  if (event.key == 'elm-conduit-user') {
    app.ports.userUpdates.send(event.newValue); 
  }
});
