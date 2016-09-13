import System.IO

main :: IO ()
--main = withFile "test.txt" ReadMode $ \h -> getlines h >>= mapM_ putStrLn 
main = withFile "unb.ppm" ReadMode $ \h -> getlines h >>= mapM_ putStrLn 

getlines :: Handle -> IO [String]
getlines h = lines `fmap` hGetContents h
