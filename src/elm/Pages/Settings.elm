module Pages.Settings exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components exposing (..)
import Types exposing (..)
import Router exposing (toUrl, userLink)


view : Model -> Html msg
view model =
    div []
        [ navBar model
        , settingsPage
        , footer_
        ]


settingsPage : Html msg
settingsPage =
    div
        [ class "settings-page" ]
        [ div
            [ class "container page" ]
            [ div
                [ class "row" ]
                [ div
                    [ class "col-md-6 offset-md-3 col-xs-12" ]
                    [ h1
                        [ class "text-xs-center" ]
                        [ text "Your Settings" ]
                    , Html.form
                        []
                        [ fieldset
                            [ class "form-group" ]
                            [ input
                                [ class "form-control", type_ "text", placeholder "URL of profile picture" ]
                                []
                            ]
                        , fieldset
                            [ class "form-group" ]
                            [ input
                                [ class "form-control form-control-lg", type_ "text", placeholder "Your Name" ]
                                []
                            ]
                        , fieldset
                            [ class "form-group" ]
                            [ textarea
                                [ class "form-control form-control-lg", rows 8, placeholder "Short bio about you" ]
                                []
                            ]
                        , fieldset
                            [ class "form-group" ]
                            [ input
                                [ class "form-control form-control-lg", type_ "text", placeholder "Email" ]
                                []
                            ]
                        , fieldset
                            [ class "form-group" ]
                            [ input
                                [ class "form-control form-control-lg", type_ "password", placeholder "Password" ]
                                []
                            ]
                        , button
                            [ class "btn btn-lg btn-primary pull-xs-right" ]
                            [ text "Update Settings" ]
                        ]
                    ]
                ]
            ]
        ]
