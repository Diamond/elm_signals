import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Color exposing (..)
import Mouse
import Window
import Time

-- MODEL

type alias Model =
  { x: Int, y: Int }

initialModel : Model
initialModel =
  { x = 300, y = 300 }

-- UPDATE

update : (Int, Int) -> Model -> Model
update (newX, newY) model =
  { model |
    x <- newX,
    y <- newY
  }

model : Signal Model
model =
  Signal.foldp update initialModel position

drawCircle : Float -> Float -> Form
drawCircle x y =
  circle 50
  |> filled red
  |> move (x, y)

position : Signal (Int, Int)
position =
  let
    pos = Mouse.position
    delta = Time.fps 30
  in
    Signal.sampleOn delta pos

-- VIEW

view : (Int, Int) -> Model -> Element
view (w, h) model =
  let
      (w', h') = (toFloat w, toFloat h)
      x = toFloat model.x - (w' / 2)
      y = (h' / 2) - toFloat model.y
  in
     collage w h [ drawCircle x y ]

main : Signal Element
main =
  Signal.map2 view Window.dimensions model
