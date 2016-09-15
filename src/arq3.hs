import System.IO

main :: IO ()
main = do xs <- fmap lines $ readFile "teste.ppm"
          mapM_ putStrLn xs
