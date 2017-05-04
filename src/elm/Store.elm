module Store exposing (..)

import Types exposing (..)
import RemoteData.Http exposing (..)
import RemoteData exposing (..)
import Json.Decode exposing (..)
import Ports


init : Value -> Store
init value =
    { user = parseUser value
    , tags = NotAsked
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


update : Msg -> Store -> Store
update msg store =
    case msg of
        HandleTags tags ->
            { store | tags = tags }

        UpdateUser user ->
            { store | user = user }


tagsDecoder : Decoder (List String)
tagsDecoder =
    field "tags" (list string)


getTags : (Msg -> msg) -> Store -> ( Store, Cmd msg )
getTags tagger store =
    ( { store | tags = Loading }
    , get (api "/tags") (tagger << HandleTags) tagsDecoder
    )


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
