module Counter exposing (..)

import Browser 
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

-- MAIN 
main : Program () Model Msg
main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model = Int

init : Model
init = 0

-- UPDATE

type Msg = Increment
  | Decrement
  | Reset
  | Add_10


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment -> model + 1
    Decrement -> model - 1
    Reset -> init
    Add_10 -> model + 10

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ div [] [ text (String.fromInt model) ]
    , button [ onClick Decrement ] [ text "-" ]
    , button [ onClick Reset] [text "Reset"]
    , button [ onClick Add_10 ] [text "+10"]
    , button [ onClick Increment ] [ text "+" ]
    ]
