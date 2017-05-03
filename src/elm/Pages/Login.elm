module Pages.Login exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components exposing (..)
import Types exposing (..)
import Router exposing (toUrl, userLink)


view : Model -> Html msg
view model =
    div []
        [ navBar model
        , authPage
        , footer_
        ]


authPage : Html msg
authPage =
    div
        [ class "auth-page" ]
        [ div
            [ class "container page" ]
            [ div
                [ class "row" ]
                [ div
                    [ class "col-md-6 offset-md-3 col-xs-12" ]
                    [ h1 [ class "text-xs-center" ]
                        [ text "Sign In" ]
                    , p [ class "text-xs-center" ]
                        [ a [ class "", href (toUrl Register) ]
                            [ text "Need an account?" ]
                        ]
                    , Html.form []
                        [ fieldset
                            [ class "form-group" ]
                            [ input
                                [ type_ "email", class "form-control form-control-lg", placeholder "Email" ]
                                []
                            ]
                        , fieldset
                            [ class "form-group" ]
                            [ input
                                [ type_ "password", class "form-control form-control-lg", placeholder "Password" ]
                                []
                            ]
                        , button
                            [ class "btn btn-lg btn-primary pull-xs-right", type_ "submit" ]
                            [ text "Sign in" ]
                        ]
                    ]
                ]
            ]
        ]
