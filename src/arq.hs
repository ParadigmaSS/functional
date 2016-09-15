import System.IO

main :: IO ()
main = do xs <- fmap lines $ readFile "unb.ppm"
          mapM_ putStrLn xs
