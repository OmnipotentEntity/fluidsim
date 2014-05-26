import qualified Graphics.UI.SDL as SDL
import Foreign.C.String
import Foreign.C.Types

main :: IO ()
main = do
  initialize
  mainLoop

mkCInt :: Int -> CInt
mkCInt n = fromIntegral n

initialize :: IO ()
initialize =
  do
    _ <- SDL.init(SDL.initFlagEverything)
    sdlWindow <- withCString "Test" $ \title ->
      SDL.createWindow title SDL.windowPosCentered SDL.windowPosCentered (mkCInt 640) (mkCInt 480) SDL.windowFlagOpenGL
    sdlRenderer <- SDL.createRenderer sdlWindow (mkCInt $ -1) SDL.rendererFlagAccelerated
    putStr "Butts\n"

mainLoop :: IO ()
mainLoop = putStr "Butts\n"
