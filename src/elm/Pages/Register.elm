module Pages.Register exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components exposing (..)
import Types exposing (..)
import Router exposing (toUrl, userLink)


view : Model -> Html msg
view model =
    div []
        [ navBar model
        , registerPage
        , footer_
        ]


registerPage : Html msg
registerPage =
    div
        [ class "auth-page" ]
        [ div
            [ class "container page" ]
            [ div
                [ class "row" ]
                [ div
                    [ class "col-md-6 offset-md-3 col-xs-12" ]
                    [ h1 [ class "text-xs-center" ]
                        [ text "Sign up" ]
                    , p [ class "text-xs-center" ]
                        [ a [ href (toUrl Login) ]
                            [ text "Have an account?" ]
                        ]
                    , ul [ class "error-messages" ]
                        [ li
                            []
                            [ text "That email is already taken" ]
                        ]
                    , Html.form []
                        [ fieldset
                            [ class "form-group" ]
                            [ input
                                [ class "form-control form-control-lg", type_ "text", placeholder "Your Name" ]
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
                            [ text "Sign up" ]
                        ]
                    ]
                ]
            ]
        ]
