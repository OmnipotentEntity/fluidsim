import qualified Graphics.UI.SDL as SDL
import Foreign.C.String
import Foreign.C.Types

main :: IO ()
main = do
  initialize
  mainLoop

mkCInt :: Int -> CInt
mkCInt = fromIntegral

initialize :: IO ()
initialize =
  do
    _ <- SDL.init SDL.initFlagEverything
    sdlWindow <- withCString "Test" $ \title ->
      SDL.createWindow title SDL.windowPosCentered SDL.windowPosCentered (mkCInt 640) (mkCInt 480) SDL.windowFlagOpenGL
    _ <- SDL.createRenderer sdlWindow (mkCInt (-1)) SDL.rendererFlagAccelerated
    putStr "Butts\n"

mainLoop :: IO ()
mainLoop = do
  putStr "LBL 10\n"
  putStr "GOTO 10\n"
  mainLoop
