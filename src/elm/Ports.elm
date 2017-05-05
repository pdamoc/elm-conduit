port module Ports exposing (saveUser, userUpdates)

import Json.Decode exposing (Value)


port saveUser : Value -> Cmd msg


port userUpdates : (Value -> msg) -> Sub msg
