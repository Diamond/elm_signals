import Graphics.Element exposing (..)
import Mouse
import Window
import Keyboard
import Char

area : (Int, Int) -> Int
area (w, h) =
  w * h

windowArea : Signal Int
windowArea =
  Signal.map area Window.dimensions

characters : Signal Char
characters =
  Signal.map Char.fromCode Keyboard.presses

pressedDigit : Signal Bool
pressedDigit =
  Signal.map Char.isDigit characters

main : Signal Element
main =
  -- Signal.map show windowArea
  -- Signal.map show characters
  Signal.map show pressedDigit
