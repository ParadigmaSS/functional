module Image
( getImagePath
, getImageFilterPath
, loadImage
, recordImage
)where

import Control.Applicative
import System.IO


-- Function which gets the path of image
getImagePath :: String -> FilePath
getImagePath namePath = namePath

-- Function which gets the path of filtered image
getImageFilterPath :: FilePath
getImageFilterPath = "imagefilter.ppm"

-- Function which is responsable to load the image
loadImage :: IO[Char]
loadImage = do
	putStr "Digite o caminho da imagem: "
	namePath <- getLine
	imageFile <- readFile (getImagePath namePath)
	return $ imageFile

-- Function which is responsable to record on the image
recordImage :: String -> IO ()
recordImage dataImage = do
	imageFilterFile <- writeFile getImageFilterPath dataImage
	return $ imageFilterFile