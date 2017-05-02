module Router exposing (..)

import UrlParser as Url exposing ((</>), (<?>), s, int, string, top)
import Types exposing (..)
import Navigation exposing (Location)


toUrl : Page -> String
toUrl page =
    (case page of
        Home ->
            ""

        Error loc ->
            "error"
    )
        |> (++) "/#/"


route : Url.Parser (Page -> a) a
route =
    Url.oneOf
        [ Url.map Home top
        ]


parse : Location -> Page
parse location =
    Url.parseHash route location
        |> Maybe.withDefault (Error location)
