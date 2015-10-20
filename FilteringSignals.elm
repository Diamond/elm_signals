import Graphics.Element exposing (..)
import Keyboard
import Char


characters : Signal Char
characters =
  Signal.map Char.fromCode Keyboard.presses

numbers : Signal Char
numbers =
  Signal.filter Char.isDigit '1' characters

noDupes : Signal Char
noDupes =
  Signal.dropRepeats numbers


main : Signal Element
main =
  Signal.map show noDupes
