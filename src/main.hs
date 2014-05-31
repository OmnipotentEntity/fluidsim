import qualified Graphics.UI.SDL as SDL
import Foreign.C.String
import Foreign.C.Types

mkCInt :: Int -> CInt
mkCInt = fromIntegral

initialize :: IO ()
initialize =
  do
    _ <- SDL.init SDL.initFlagEverything
    sdlWindow <- withCString "Test" $ \title ->
      SDL.createWindow title SDL.windowPosCentered SDL.windowPosCentered (mkCInt 640) (mkCInt 480) SDL.windowFlagOpenGL
    _ <- SDL.createRenderer sdlWindow (mkCInt (-1)) SDL.rendererFlagAccelerated
    return ()

main :: IO ()
main = do
    initialize
    putStrLn ">10 PRINT \"LOOK AROUND YOU\""
    putStrLn ">20 GOTO 10"
    sequence_ $ repeat $ putStr "LOOK AROUND YOU"
