import System.IO

main :: IO ()
main = do h <- openFile "teste.ppm" ReadMode 
          xs <- getlines h
          sequence_ $ map putStrLn xs

getlines :: Handle -> IO [String]
getlines h = hGetContents h >>= return . lines
