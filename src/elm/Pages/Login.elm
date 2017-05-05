module Pages.Login exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Components exposing (..)
import Types exposing (..)
import Router exposing (toUrl, userLink)


-- MODEL


type alias Model =
    { email : String
    , password : String
    }


init : Model
init =
    Model "" ""



-- UPDATE


type Msg
    = Email String
    | Password String


type alias MainModel m =
    { m | pageLogin : Model }


update : Msg -> MainModel m -> ( MainModel m, Cmd msg )
update msg ({ pageLogin } as mainmodel) =
    case msg of
        Email str ->
            ( { mainmodel | pageLogin = { pageLogin | email = str } }, Cmd.none )

        Password str ->
            ( { mainmodel | pageLogin = { pageLogin | password = str } }, Cmd.none )



-- VIEW


type alias Props msg =
    { tagger : Msg -> msg
    , store : Store
    , currentPage : Page
    , login : String -> String -> msg
    , model : Model
    }


view : Props msg -> Html msg
view props =
    div []
        [ navBar props
        , authPage props
        , footer_
        ]


authPage : Props msg -> Html msg
authPage ({ model } as props) =
    box "auth-page"
        [ box "container page"
            [ row
                [ box "col-md-6 offset-md-3 col-xs-12"
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
                                [ type_ "email"
                                , class "form-control form-control-lg"
                                , placeholder "Email"
                                , onInput (props.tagger << Email)
                                ]
                                []
                            ]
                        , fieldset
                            [ class "form-group" ]
                            [ input
                                [ type_ "password"
                                , class "form-control form-control-lg"
                                , placeholder "Password"
                                , onInput (props.tagger << Password)
                                ]
                                []
                            ]
                        , button
                            [ class "btn btn-lg btn-primary pull-xs-right"
                            , type_ "submit"
                            , onClick (props.login model.email model.password)
                            ]
                            [ text "Sign in" ]
                        ]
                    ]
                ]
            ]
        ]
