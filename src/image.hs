import Control.Applicative
import System.IO
import Data.List

-- Function which gets the path of image
getImagePath :: FilePath
getImagePath = "unb.ppm"

getImageFilterPath :: FilePath
getImageFilterPath = "filterunb.ppm"

-- Function which applies the negative filter on image
applyNegative :: [Int] -> [Int]
-- Verify if list is empty
applyNegative [] = []
-- Modify the header of list and pass to the tail list
applyNegative (h:t) = h - 255 : (applyNegative t)

transformListToString :: [Int] -> String
transformListToString  lista = concat $ map show lista

-- Function its start the program
main :: IO ()
main = do
	-- Read the image file
	imageFile <- readFile getImagePath
	let header = take 20 imageFile
	let imageData = drop 20 imageFile
	-- Convert the image data to a list of ints
	let intList = map read $ words imageData :: [Int]
	let imageFilterData = applyNegative intList
	let imageFilterString = words (transformListToString imageFilterData)
	let filterData = intercalate " " imageFilterString 
	let imageFilter = header ++ filterData
	imageFilterFile <- writeFile getImageFilterPath imageFilter
	putStrLn $ show imageFilterString