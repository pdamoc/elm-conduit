module Components exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Router exposing (toUrl, userLink)


avatarImageSrc : Maybe String -> Attribute msg
avatarImageSrc =
    src << (Maybe.withDefault "https://static.productionready.io/images/smiley-cyrus.jpg")


navBar : Model -> Html msg
navBar { context, currentPage } =
    let
        navLinkClass page =
            if page == currentPage then
                "nav-link active"
            else
                "nav-link"

        headerLink page message icon =
            li [ class "nav-item" ]
                [ a [ class (navLinkClass page), href (toUrl page) ]
                    [ i [ class <| Maybe.withDefault "" icon ]
                        []
                    , text message
                    ]
                ]

        links =
            case context.user of
                Nothing ->
                    [ headerLink Home "Home" Nothing
                    , headerLink Login "Sign In " Nothing
                    , headerLink Register "Sign Up" Nothing
                    ]

                Just user ->
                    [ headerLink Home "Home" Nothing
                    , headerLink Editor "&nbsp;New Post" (Just "ion-compose")
                    , headerLink Settings "&nbsp;Settings" (Just "ion-gear-a")
                    , a [ class "nav-link", href (userLink user) ]
                        [ img [ avatarImageSrc user.image, class "user-pic" ] []
                        , text user.username
                        ]
                    ]
    in
        nav [ class "navbar navbar-light" ]
            [ div [ class "container" ]
                [ a [ class "navbar-brand", href "#/" ]
                    [ img [ class "elm-conduit-logo", src "static/img/elm-conduit-logo.png" ] [] ]
                , ul [ class "nav navbar-nav pull-xs-right" ] links
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
