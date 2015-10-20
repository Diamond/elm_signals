import Graphics.Element exposing (..)
import Keyboard
import Char
import String exposing (toInt, fromChar)

parseInt : Char -> Maybe Int
parseInt character =
  case String.toInt (String.fromChar character) of
    Ok value ->
      Just value
    Err error ->
      Nothing

characters : Signal Char
characters =
  Signal.map Char.fromCode Keyboard.presses

integers : Signal Int
integers =
  Signal.filterMap parseInt 0 characters


main : Signal Element
main =
  Signal.map show integers
