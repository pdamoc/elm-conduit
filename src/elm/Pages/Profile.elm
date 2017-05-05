module Pages.Profile exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components exposing (..)
import Types exposing (..)


view : { c | store : Store, currentPage : Page } -> Html msg
view props =
    div []
        [ navBar props
        , profilePage props.store
        , footer_
        ]


profilePage : a -> Html msg
profilePage store =
    div
        [ class "profile-page" ]
        [ div
            [ class "user-info" ]
            [ div
                [ class "container" ]
                [ div
                    [ class "row" ]
                    [ div
                        [ class "col-xs-12 col-md-10 offset-md-1" ]
                        [ img
                            [ src "http://i.imgur.com/Qr71crq.jpg", class "user-img" ]
                            []
                        , h4
                            []
                            [ text "Eric Simons" ]
                        , p
                            []
                            [ text "Cofounder @GoThinkster, lived in Aol's HQ for a few months, kinda looks like Peeta from the Hunger Games\n          " ]
                        , button
                            [ class "btn btn-sm btn-outline-secondary action-btn" ]
                            [ i
                                [ class "ion-plus-round" ]
                                [ text
                                    "Follow Eric Simons \n          "
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        , div
            [ class "container" ]
            [ div
                [ class "row" ]
                [ div
                    [ class "col-xs-12 col-md-10 offset-md-1" ]
                    [ div
                        [ class "articles-toggle" ]
                        [ ul
                            [ class "nav nav-pills outline-active" ]
                            [ li
                                [ class "nav-item" ]
                                [ a
                                    [ class "nav-link active", href "" ]
                                    [ text "My Articles" ]
                                ]
                            , li
                                [ class "nav-item" ]
                                [ a
                                    [ class "nav-link", href "" ]
                                    [ text "Favorited Articles" ]
                                ]
                            ]
                        ]
                    , div
                        [ class "article-preview" ]
                        [ div
                            [ class "article-meta" ]
                            [ a
                                [ href "" ]
                                [ img
                                    [ src "http://i.imgur.com/Qr71crq.jpg" ]
                                    []
                                ]
                            , div
                                [ class "info" ]
                                [ a
                                    [ href "", class "author" ]
                                    [ text "Eric Simons" ]
                                , span
                                    [ class "date" ]
                                    [ text "January 20th" ]
                                ]
                            , button
                                [ class "btn btn-outline-primary btn-sm pull-xs-right" ]
                                [ i
                                    [ class "ion-heart" ]
                                    [ text
                                        "29\n            "
                                    ]
                                ]
                            ]
                        , a
                            [ href "", class "preview-link" ]
                            [ h1
                                []
                                [ text "How to build webapps that scale"
                                ]
                            , p
                                []
                                [ text "This is the description for the post."
                                ]
                            , span
                                []
                                [ text "Read more..."
                                ]
                            ]
                        ]
                    , div
                        [ class "article-preview" ]
                        [ div
                            [ class "article-meta" ]
                            [ a
                                [ href "" ]
                                [ img
                                    [ src "http://i.imgur.com/N4VcUeJ.jpg" ]
                                    []
                                ]
                            , div
                                [ class "info" ]
                                [ a
                                    [ href "", class "author" ]
                                    [ text "Albert Pai" ]
                                , span
                                    [ class "date" ]
                                    [ text "January 20th" ]
                                ]
                            , button
                                [ class "btn btn-outline-primary btn-sm pull-xs-right" ]
                                [ i
                                    [ class "ion-heart" ]
                                    [ text "32" ]
                                ]
                            ]
                        , a
                            [ href "", class "preview-link" ]
                            [ h1
                                []
                                [ text "The song you won't ever stop singing. No matter how hard you try."
                                ]
                            , p
                                []
                                [ text "This is the description for the post."
                                ]
                            , span
                                []
                                [ text "Read more..."
                                ]
                            , ul
                                [ class "tag-list" ]
                                [ li
                                    [ class "tag-default tag-pill tag-outline" ]
                                    [ text "Music" ]
                                , li
                                    [ class "tag-default tag-pill tag-outline" ]
                                    [ text "Song" ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
