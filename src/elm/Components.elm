module Components exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Router exposing (toUrl, userLink)
import RemoteData exposing (..)


avatarImageSrc : Maybe String -> Attribute msg
avatarImageSrc =
    src << (Maybe.withDefault "https://static.productionready.io/images/smiley-cyrus.jpg")


navBar : { c | store : Store, currentPage : Page } -> Html msg
navBar { store, currentPage } =
    let
        navLinkClass page =
            if page == currentPage then
                "nav-link active"
            else
                "nav-link"

        navItem item =
            li [ class "nav-item" ] [ item ]

        headerLink page message icon =
            navItem <|
                a [ class (navLinkClass page), href (toUrl page) ]
                    [ i [ class <| Maybe.withDefault "" icon ]
                        []
                    , text message
                    ]

        links =
            case store.user of
                Nothing ->
                    [ headerLink Home "Home" Nothing
                    , headerLink Login "Sign In " Nothing
                    , headerLink Register "Sign Up" Nothing
                    ]

                Just user ->
                    [ headerLink Home "Home" Nothing
                    , headerLink Editor "New Post" (Just "ion-compose")
                    , headerLink Settings "Settings" (Just "ion-gear-a")
                    , navItem <|
                        a [ class "nav-link", href (userLink user) ]
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


tagList : WebData (List String) -> Html msg
tagList webtags =
    let
        toTag tag =
            a [ class "tag-pill tag-default", href "" ]
                [ text tag ]
    in
        case webtags of
            NotAsked ->
                div [ class "tag-list" ]
                    [ text "Loading..." ]

            Loading ->
                div [ class "tag-list" ]
                    [ text "Loading..." ]

            Success tags ->
                div [ class "tag-list" ]
                    (List.map toTag tags)

            Failure _ ->
                div [ class "tag-list" ]
                    [ text "There was an error retreiving the tags. Please reload the page." ]


box : String -> List (Html msg) -> Html msg
box className =
    div [ class className ]


row : List (Html msg) -> Html msg
row =
    box "row"
