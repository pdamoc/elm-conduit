module Components exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


navBar : Html msg
navBar =
    nav [ class "navbar navbar-light" ]
        [ div [ class "container" ]
            [ a [ class "navbar-brand", href "#/" ]
                [ img [ class "elm-conduit-logo", src "static/img/elm-conduit-logo.png" ] [] ]
            , ul [ class "nav navbar-nav pull-xs-right" ]
                [ headerLink "#/" "Home" Nothing
                , headerLink "#/" "New Post" (Just "ion-compose")
                , headerLink "#/settings" "Settings" (Just "ion-gear-a")
                , headerLink "#/register" "Sign Up" Nothing
                ]
            ]
        ]


headerLink : String -> String -> Maybe String -> Html msg
headerLink destination message icon =
    li [ class "nav-item" ]
        [ a [ class "nav-link", href destination ]
            [ i [ class <| Maybe.withDefault "" icon ]
                []
            , text message
            ]
        ]


footer_ : Html msg
footer_ =
    a
        [ href "https://github.com/pdamoc/elm-conduit"
        , target "_blank"
        , class "footer-fork"
        ]
        [ i
            [ class "ion-social-github" ]
            []
        , text "Fork on GitHub"
        ]


outlineTag : String -> Html msg
outlineTag tag =
    li
        [ class "tag-default tag-pill tag-outline" ]
        [ text tag ]


tagList : List String -> Html msg
tagList tags =
    let
        toTag tag =
            a [ class "tag-pill tag-default", href "" ]
                [ text tag ]
    in
        div [ class "tag-list" ]
            (List.map toTag tags)
