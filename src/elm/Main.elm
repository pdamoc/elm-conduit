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
import Store


-- PAGES

import Pages.Home
import Pages.Login
import Pages.Register
import Pages.Editor
import Pages.Settings
import Pages.Error


-- APP


main : Program Value Model Msg
main =
    Navigation.programWithFlags UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


init : Value -> Location -> ( Model, Cmd Msg )
init userValue location =
    let
        currentPage =
            (Router.parse location)

        ( initStore, cmds ) =
            Store.loadPage UpdateStore currentPage (Store.init userValue)

        initModel =
            { currentPage = currentPage
            , store = initStore
            }
    in
        ( initModel, cmds )



-- UPDATE


type Msg
    = UrlChange Location
    | UpdateStore Store.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            let
                page =
                    Router.parse location

                ( newStore, cmds ) =
                    Store.loadPage UpdateStore page model.store
            in
                ( { model | currentPage = page, store = newStore }, cmds )

        UpdateStore storeMsg ->
            ( { model | store = Store.update storeMsg model.store }, Cmd.none )



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
    Store.subscription UpdateStore
