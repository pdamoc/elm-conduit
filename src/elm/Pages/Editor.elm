module Pages.Editor exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components exposing (..)
import Types exposing (..)


view : Model -> Html msg
view model =
    div []
        [ navBar model
        , editorPage
        , footer_
        ]


editorPage : Html msg
editorPage =
    box "editor-page"
        [ box "container page"
            [ row
                [ box "col-md-10 offset-md-1 col-xs-12"
                    [ Html.form
                        []
                        [ fieldset
                            [ class "form-group" ]
                            [ input
                                [ type_ "text", class "form-control form-control-lg", placeholder "Article Title" ]
                                []
                            ]
                        , fieldset
                            [ class "form-group" ]
                            [ input
                                [ type_ "text", class "form-control", placeholder "What's this article about?" ]
                                []
                            ]
                        , fieldset
                            [ class "form-group" ]
                            [ textarea
                                [ class "form-control", rows 8, placeholder "Write your article (in markdown)" ]
                                []
                            ]
                        , fieldset
                            [ class "form-group" ]
                            [ input
                                [ type_ "text", class "form-control", placeholder "Enter tags" ]
                                []
                            , box "tag-list"
                                []
                            ]
                        , button
                            [ class "btn btn-lg pull-xs-right btn-primary", type_ "button" ]
                            [ text "Publish Article"
                            ]
                        ]
                    ]
                ]
            ]
        ]
