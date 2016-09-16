import Control.Applicative
import System.IO
import Data.List

-- Function which gets the path of image
getImagePath :: FilePath
getImagePath = "imagem.ppm"

getImageFilterPath :: FilePath
getImageFilterPath = "imagefilter.ppm"

-- Function which applies the negative filter on image
applyNegative :: [Int] -> [Int]
-- Verify if list is empty
applyNegative [] = []
-- Modify the header of list and pass to the tail list
applyNegative (h:t) = h - 255 : (applyNegative t)

transformListToString :: [Int] -> String
transformListToString [] = ""
transformListToString (h:t) = show h ++ " " ++ (transformListToString t)

-- Function its start the program
main :: IO ()
main = do
	-- Read the image file
	imageFile <- readFile getImagePath
	let header = lines $ take 20 imageFile
	let imageData = drop 20 imageFile
	-- Convert the image data to a list of ints
	let intList = map read $ words imageData :: [Int]
	let imageFilterData = applyNegative intList
	let imageFilterString = words (transformListToString imageFilterData)
	let imageFilter = unlines $ (header ++ imageFilterString)
	imageFilterFile <- writeFile getImageFilterPath imageFilter
	putStrLn $ show (unlines header)