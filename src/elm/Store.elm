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


getTags : Cmd Msg
getTags =
    get (api "/tags") HandleTags tagsDecoder


tagsOrEmptyList : Store -> List String
tagsOrEmptyList store =
    RemoteData.withDefault [] store.tags


loadPage : (Msg -> msg) -> Page -> Cmd msg
loadPage tagger page =
    case page of
        Home ->
            Cmd.map tagger getTags

        _ ->
            Cmd.none



-- Subscription


subscription : (Msg -> msg) -> Sub msg
subscription lift =
    Ports.userUpdates (lift << UpdateUser << parseUser)
