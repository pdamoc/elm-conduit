module Main exposing (main)

{-| This is the main entry into the `Elm Conduit` web app.

This file takes care of wiring The Elm Architecture.

-}

import Html exposing (..)
import Navigation exposing (Location)
import Types exposing (..)
import Router exposing (toUrl)
import Api


-- PAGES

import Pages.Home
import Pages.Error


-- APP


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { currentPage : Page
    }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        initModel =
            { currentPage = (Router.parse location)
            }
    in
        ( initModel, Api.loadPage initModel.currentPage )



-- UPDATE


type Msg
    = UrlChange Location


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            let
                page =
                    Router.parse location
            in
                ( { model | currentPage = page }, Api.loadPage page )



-- VIEW


view : Model -> Html Msg
view model =
    case model.currentPage of
        Home ->
            Pages.Home.view

        Error loc ->
            Pages.Error.view (toString loc)



-- SUBSCRIPTION


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
