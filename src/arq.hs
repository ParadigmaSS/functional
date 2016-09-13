import System.IO

main :: IO ()
--main = do h <- openFile "test.txt" ReadMode 
main = do h <- openFile "unb.ppm" ReadMode 
          xs <- getlines h
          sequence_ $ map putStrLn xs

getlines :: Handle -> IO [String]
getlines h = hGetContents h >>= return . lines
