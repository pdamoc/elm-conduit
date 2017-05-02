module Pages.Error exposing (..)

import Html exposing (..)


view : String -> Html msg
view err =
    text err
