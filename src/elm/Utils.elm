module Utils exposing (..)

import Json.Encode as JE exposing (Value)


maybe : (a -> Value) -> Maybe a -> Value
maybe encoder val =
    Maybe.map encoder val
        |> Maybe.withDefault JE.null
