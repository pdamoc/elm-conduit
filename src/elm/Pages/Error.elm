module Pages.Error exposing (..)

import Html exposing (..)
import Types exposing (Context, Model)


view : Model -> String -> Html msg
view model err =
    text err
