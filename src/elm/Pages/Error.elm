module Pages.Error exposing (..)

import Html exposing (..)
import Types exposing (Model)


view : Model -> String -> Html msg
view model err =
    text err
