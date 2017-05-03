module Main exposing (main)

{-| This is the main entry into the `Elm Conduit` web app.

This file takes care of wiring The Elm Architecture.

-}

import Html exposing (..)
import Navigation exposing (Location)
import Json.Decode exposing (Value)


-- HELPER MODULES

import Types exposing (..)
import Router exposing (toUrl)
import Api
import Ports


-- PAGES

import Pages.Home
import Pages.Login
import Pages.Register
import Pages.Editor
import Pages.Settings
import Pages.Error


-- APP


main : Program (Maybe Value) Model Msg
main =
    Navigation.programWithFlags UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


init : Maybe Value -> Location -> ( Model, Cmd Msg )
init rawContext location =
    let
        initModel =
            { currentPage = (Router.parse location)
            , context = parseContext rawContext
            }
    in
        ( initModel, Api.loadPage initModel.currentPage )



-- UPDATE


type Msg
    = UrlChange Location
    | ContextUpdated Context


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            let
                page =
                    Router.parse location
            in
                ( { model | currentPage = page }, Api.loadPage page )

        ContextUpdated context ->
            ( { model | context = context }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    case model.currentPage of
        Home ->
            Pages.Home.view model

        Login ->
            Pages.Login.view model

        Register ->
            Pages.Register.view model

        Editor ->
            Pages.Editor.view model

        Settings ->
            Pages.Settings.view model

        Error loc ->
            Pages.Error.view model (toString loc)



-- SUBSCRIPTION


subscriptions : Model -> Sub Msg
subscriptions model =
    Ports.contextSubscription ContextUpdated
