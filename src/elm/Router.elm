module Router exposing (..)

import UrlParser as Url exposing ((</>), (<?>), s, int, string, top, custom, Parser)
import Types exposing (..)
import Navigation exposing (Location)
import String


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

        ProfilePage username ->
            "@" ++ username

        ArticlePage slug ->
            "article/" ++ slug

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
        , Url.map ProfilePage username
        , Url.map ArticlePage (s "article" </> string)
        ]


username : Parser (String -> a) a
username =
    custom "USERNAME" <|
        \segment ->
            if String.startsWith "@" segment then
                Ok (String.dropLeft 1 segment)
            else
                Err "Not a Username"


parse : Location -> Page
parse location =
    Url.parseHash route location
        |> Maybe.withDefault (Error location)
