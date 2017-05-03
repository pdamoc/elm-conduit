module Router exposing (..)

import UrlParser as Url exposing ((</>), (<?>), s, int, string, top)
import Types exposing (..)
import Navigation exposing (Location)


toUrl : Page -> String
toUrl page =
    (case page of
        Home ->
            ""

        Register ->
            "register"

        Login ->
            "login"

        Editor ->
            "editor"

        Settings ->
            "settings"

        Error loc ->
            "error"
    )
        |> (++) "#/"


userLink : User -> String
userLink user =
    ("#/@" ++ user.username)


route : Url.Parser (Page -> a) a
route =
    Url.oneOf
        [ Url.map Home top
        , Url.map Login (s "login")
        , Url.map Register (s "register")
        , Url.map Editor (s "editor")
        , Url.map Settings (s "settings")
        ]


parse : Location -> Page
parse location =
    Url.parseHash route location
        |> Maybe.withDefault (Error location)
