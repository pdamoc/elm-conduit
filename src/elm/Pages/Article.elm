module Pages.Article exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components exposing (..)
import Types exposing (..)


view : { c | store : Store, currentPage : Page } -> Html msg
view props =
    div []
        [ navBar props
        , articlePage props.store
        , footer_
        ]


articlePage : Store -> Html msg
articlePage store =
    div
        [ class "article-page" ]
        [ div
            [ class "banner" ]
            [ div
                [ class "container" ]
                [ h1
                    []
                    [ text "How to build webapps that scale" ]
                , div
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
                        [ class "btn btn-sm btn-outline-secondary" ]
                        [ i
                            [ class "ion-plus-round" ]
                            [ text "Follow Eric Simons "
                            ]
                        , span
                            [ class "counter" ]
                            [ text "(10)" ]
                        ]
                    , button
                        [ class "btn btn-sm btn-outline-primary" ]
                        [ i
                            [ class "ion-heart" ]
                            [ text "Favorite Post "
                            ]
                        , span
                            [ class "counter" ]
                            [ text "(29)" ]
                        ]
                    ]
                ]
            ]
        , div
            [ class "container page" ]
            [ div
                [ class "row article-content" ]
                [ div
                    [ class "col-md-12" ]
                    [ p
                        []
                        [ text "Web development technologies have evolved at an incredible clip over the past few years.\n        "
                        ]
                    , h2
                        [ id "introducing-ionic" ]
                        [ text "Introducing RealWorld."
                        ]
                    , p
                        []
                        [ text "It's a great solution for learning how other frameworks work."
                        ]
                    ]
                ]
            , hr
                []
                []
            , div
                [ class "article-actions" ]
                [ div
                    [ class "article-meta" ]
                    [ a
                        [ href "profile.html" ]
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
                        [ class "btn btn-sm btn-outline-secondary" ]
                        [ i
                            [ class "ion-plus-round" ]
                            [ text
                                "Follow Eric Simons "
                            ]
                        , span
                            [ class "counter" ]
                            [ text "(10)" ]
                        ]
                    , button
                        [ class "btn btn-sm btn-outline-primary" ]
                        [ i
                            [ class "ion-heart" ]
                            [ text
                                "Favorite Post "
                            ]
                        , span
                            [ class "counter" ]
                            [ text "(29)" ]
                        ]
                    ]
                ]
            , div
                [ class "row" ]
                [ div
                    [ class "col-xs-12 col-md-8 offset-md-2" ]
                    [ Html.form
                        [ class "card comment-form" ]
                        [ div
                            [ class "card-block" ]
                            [ textarea
                                [ class "form-control", placeholder "Write a comment...", rows 3 ]
                                []
                            ]
                        , div
                            [ class "card-footer" ]
                            [ img
                                [ src "http://i.imgur.com/Qr71crq.jpg", class "comment-author-img" ]
                                []
                            , button
                                [ class "btn btn-sm btn-primary" ]
                                [ text "Post Comment\n            " ]
                            ]
                        ]
                    , div
                        [ class "card" ]
                        [ div
                            [ class "card-block" ]
                            [ p
                                [ class "card-text" ]
                                [ text "With supporting text below as a natural lead-in to additional content." ]
                            ]
                        , div
                            [ class "card-footer" ]
                            [ a
                                [ href "", class "comment-author" ]
                                [ img
                                    [ src "http://i.imgur.com/Qr71crq.jpg", class "comment-author-img" ]
                                    []
                                ]
                            , a
                                [ href "", class "comment-author" ]
                                [ text "Jacob Schmidt"
                                ]
                            , span
                                [ class "date-posted" ]
                                [ text "Dec 29th"
                                ]
                            ]
                        ]
                    , div
                        [ class "card" ]
                        [ div
                            [ class "card-block" ]
                            [ p
                                [ class "card-text" ]
                                [ text "With supporting text below as a natural lead-in to additional content."
                                ]
                            ]
                        , div
                            [ class "card-footer" ]
                            [ a
                                [ href "", class "comment-author" ]
                                [ img
                                    [ src "http://i.imgur.com/Qr71crq.jpg", class "comment-author-img" ]
                                    []
                                ]
                            , a
                                [ href "", class "comment-author" ]
                                [ text "Jacob Schmidt"
                                ]
                            , span
                                [ class "date-posted" ]
                                [ text "Dec 29th"
                                ]
                            , span
                                [ class "mod-options" ]
                                [ i
                                    [ class "ion-edit" ]
                                    []
                                , i
                                    [ class "ion-trash-a" ]
                                    []
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
