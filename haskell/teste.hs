import System.IO
import Data.Array.IO

-- Function which applies the negative filter on image                      
applyNegative :: [Int] -> [Int]
-- Verify if list is empty
applyNegative [] = []
-- Modify the header of list and pass to the tail list
applyNegative (h:t) = [h - 255] ++ (applyNegative t)

main :: IO ()
main = do 
       inh <- openFile "unb.ppm" ReadMode
       outh <- openFile "saida.ppm" WriteMode
       mainloop inh outh
       hClose inh
       hClose outh

mainloop :: Handle -> Handle -> IO ()
mainloop inh outh = 
    do ineof <- hIsEOF inh
       if ineof
           then return ()
           else do inpStr <- hGetLine inh
                   --hPutStrLn outh inpStr
                   hPutArray outh inpStr
                   mainloop inh outh
