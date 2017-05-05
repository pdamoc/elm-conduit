module Store exposing (..)

import Types exposing (..)
import RemoteData.Http exposing (..)
import RemoteData exposing (..)
import Json.Decode exposing (..)
import Json.Encode as JE
import Ports


init : Value -> Store
init value =
    { user = parseUser value
    , tags = NotAsked
    , login = NotAsked
    }


server : String
server =
    "https://conduit.productionready.io/api"


api : String -> String
api path =
    server ++ path


type Msg
    = HandleTags (WebData (List String))
    | UpdateUser (Maybe User)
    | HandleLogin (WebData User)
    | Login String String


update :
    (Msg -> msg)
    -> Msg
    -> { m | store : Store }
    -> ( { m | store : Store }, Cmd msg, Maybe Page )
update tagger msg ({ store } as mainmodel) =
    case msg of
        HandleTags tags ->
            ( { mainmodel | store = { store | tags = tags } }
            , Cmd.none
            , Nothing
            )

        HandleLogin login ->
            case login of
                Success user ->
                    ( { mainmodel | store = { store | user = Just user } }
                    , Cmd.none
                    , Just Home
                    )

                _ ->
                    ( mainmodel, Cmd.none, Nothing )

        UpdateUser user ->
            ( { mainmodel | store = { store | user = user } }
            , Cmd.none
            , Nothing
            )

        Login email pass ->
            let
                body =
                    JE.object
                        [ ( "user"
                          , JE.object
                                [ ( "email", JE.string email )
                                , ( "password", JE.string pass )
                                ]
                          )
                        ]
            in
                ( { mainmodel | store = { store | login = Loading } }
                , post (api "/users/login") (tagger << HandleLogin) (field "user" userDecoder) body
                , Nothing
                )


tagsDecoder : Decoder (List String)
tagsDecoder =
    field "tags" (list string)


getTags : (Msg -> msg) -> Store -> ( Store, Cmd msg )
getTags tagger store =
    ( { store | tags = Loading }
    , get (api "/tags") (tagger << HandleTags) tagsDecoder
    )


login : (Msg -> msg) -> String -> String -> msg
login tagger email pass =
    tagger (Login email pass)


loadPage : (Msg -> msg) -> Page -> Store -> ( Store, Cmd msg )
loadPage tagger page store =
    case page of
        Home ->
            getTags tagger store

        _ ->
            ( store, Cmd.none )



-- Subscription


subscription : (Msg -> msg) -> Sub msg
subscription lift =
    Ports.userUpdates (lift << UpdateUser << parseUser)
