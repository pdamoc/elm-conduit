// pull in desired CSS/SASS files
require( './styles/main.scss' );
// var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js' );           // <--- remove if jQuery not needed
// require( '../../node_modules/bootstrap-sass/assets/javascripts/bootstrap.js' );   // <--- remove if Bootstrap's JS not needed 

// inject bundled Elm app into div#main
var Elm = require( '../elm/Main' );
var mainNode = document.getElementById( 'main' );
var user = localStorage.getItem('elm-conduit-user');
var user = storedUser ? storedUser : "{}";
var app = Elm.Main.embed(mainNode, user);

app.ports.updateUser.subscribe(function(user) {
    localStorage.setItem('elm-conduit-user', user);
});

addEvent(window, 'storage', function (event) {
  if (event.key == 'elm-conduit-user') {
    app.ports.userUpdates.send(event.newValue); 
  }
});
