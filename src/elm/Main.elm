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
import Pages.Profile
import Pages.Error


-- APP


main : Program Value MainModel Msg
main =
    Navigation.programWithFlags UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


{-| The Main Model
-}
type alias MainModel =
    { currentPage : Page
    , store : Store
    , pageLogin : Pages.Login.Model
    }


init : Value -> Location -> ( MainModel, Cmd Msg )
init userValue location =
    let
        currentPage =
            (Router.parse location)

        ( initStore, cmds ) =
            Store.loadPage UpdateStore currentPage (Store.init userValue)

        initModel =
            { currentPage = currentPage
            , store = initStore
            , pageLogin = Pages.Login.init
            }
    in
        ( initModel, cmds )



-- UPDATE


type Msg
    = UrlChange Location
    | UpdateStore Store.Msg
    | PageLoginMsg Pages.Login.Msg


update : Msg -> MainModel -> ( MainModel, Cmd Msg )
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
            case Store.update UpdateStore storeMsg model of
                ( newModel, cmds, Nothing ) ->
                    ( newModel, cmds )

                ( newModel, cmds, Just page ) ->
                    ( newModel
                    , Cmd.batch [ Store.updateUser newModel.store, Navigation.newUrl (toUrl page) ]
                    )

        PageLoginMsg pMsg ->
            Pages.Login.update pMsg model



-- VIEW


view : MainModel -> Html Msg
view model =
    case model.currentPage of
        Home ->
            Pages.Home.view model

        Login ->
            Pages.Login.view
                { tagger = PageLoginMsg
                , store = model.store
                , currentPage = model.currentPage
                , login = Store.login UpdateStore
                , model = model.pageLogin
                }

        Register ->
            Pages.Register.view model

        Editor ->
            Pages.Editor.view model

        Settings ->
            Pages.Settings.view model

        ProfilePage username ->
            Pages.Profile.view model

        Error loc ->
            Pages.Error.view (toString loc)



-- SUBSCRIPTION


subscriptions : MainModel -> Sub Msg
subscriptions model =
    Store.subscription UpdateStore
