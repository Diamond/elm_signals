import Graphics.Element exposing (..)
import Keyboard
import Char

characters : Signal Char
characters =
  Signal.map Char.fromCode Keyboard.presses

charactersSoFar : Signal (List Char)
charactersSoFar =
  Signal.foldp (::) [] characters

main : Signal Element
main =
  Signal.map show charactersSoFar
