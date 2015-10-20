import Graphics.Element exposing (..)
import Time

tick : Signal Float
tick =
  Time.fps 1

tock : Signal Int
tock =
  Signal.foldp (\_ count -> count + 1) 0 tick

main : Signal Element
main =
  Signal.map show tock
