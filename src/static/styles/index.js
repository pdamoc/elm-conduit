// pull in desired CSS/SASS files
require( './styles/main.scss' );
// var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js' );           // <--- remove if jQuery not needed
// require( '../../node_modules/bootstrap-sass/assets/javascripts/bootstrap.js' );   // <--- remove if Bootstrap's JS not needed 

// inject bundled Elm app into div#main
var Elm = require( '../elm/Main' );
var mainNode = document.getElementById( 'main' );
var storedContext = localStorage.getItem('elm-conduit-context');
var context = storedContext ? storedContext : null;
var app = Elm.Main.embed(mainNode, context);

app.ports.updateContextValue.subscribe(function(context) {
    localStorage.setItem('elm-conduit-context', context);
});

addEvent(window, 'storage', function (event) {
  if (event.key == 'elm-conduit-context') {
    app.ports.contextUpdates.send(event.newValue); 
  }
});
