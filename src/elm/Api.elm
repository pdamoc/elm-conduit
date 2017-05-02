module Api exposing (..)

import Types exposing (..)


server : String
server =
    "https://conduit.productionready.io/api"


loadPage : Page -> Cmd msg
loadPage page =
    Cmd.none
