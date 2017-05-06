The code is structured as follows: 

```
├── docs/ - output folder for the Demo. The GitHub Page for the project mounts here
├── elm-package.json 
├── LICENSE 
├── logo.png - logo used in README.md 
├── package.json - defines the development and production modes
├── README.md 
├── src/ - main source code folder
│   ├── elm/ - all elm source code
│   │   ├── Components.elm - small view helpers that are used in multiple pages
│   │   ├── Main.elm - App entry point; All the wireing is done here
│   │   ├── Pages/ - namespace for the pages 
│   │   │   ├── Article.elm
│   │   │   ├── Editor.elm
│   │   │   ├── Error.elm
│   │   │   ├── Home.elm
│   │   │   ├── Login.elm
│   │   │   ├── Profile.elm
│   │   │   ├── Register.elm
│   │   │   ├── Settings.elm
│   │   ├── Ports.elm - all the ports declarations 
│   │   ├── Router.elm - Helpers to parse locations to Pages and to convert Pages back to locations 
│   │   ├── Store.elm - Manages all the interaction with the Backend and exposes a WebData interface to the views 
│   │   ├── Utils.elm - Helper functions that either should have been in libraries or are imported in multiple places.  
│   ├── favicon.ico
│   ├── static/ - assets (images, CSS, JS)
│   │   ├── img/ - images for the project 
│   │   │   ├── elm-conduit-logo.png
│   │   │   ├── elm-conduit.png
│   │   │   ├── favicon-16x16.png
│   │   │   ├── favicon-32x32.png
│   │   ├── styles/ - styles for the project
│   │   │   ├── main.scss - main SCSS for the project; add your styles here
│   │   ├── index.js - main JS file; Elm is mounted here; JS side of ports is handled here
├── STRUCTURE.md 
├── webpack.config.md - WebPack configuration file
```