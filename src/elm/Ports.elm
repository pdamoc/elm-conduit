port module Ports exposing (updateContext, contextSubscription)

import Json.Decode exposing (Value)
import Types exposing (parseContext, contextEncoder, Context)


updateContext : Context -> Cmd msg
updateContext =
    updateContextValue << contextEncoder


port updateContextValue : Value -> Cmd msg


port contextUpdates : (Maybe Value -> msg) -> Sub msg


contextSubscription : (Context -> msg) -> Sub msg
contextSubscription lift =
    contextUpdates (lift << parseContext)
