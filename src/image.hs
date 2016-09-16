import Control.Applicative
import System.IO
import System.CPUTime
import Text.Printf

-- Function which gets the path of image
getImagePath :: FilePath
getImagePath = "big_image.ppm"

getImageFilterPath :: FilePath
getImageFilterPath = "imagefilter.ppm"

-- Function which applies the negative filter on image
applyNegative :: [Int] -> [Int]
-- Verify if list is empty
applyNegative [] = []
-- Modify the header of list and pass to the tail list
applyNegative (h:t) = 255 - h : (applyNegative t)

transformListToString :: [Int] -> String
transformListToString [] = ""
transformListToString (h:t) = show h ++ " " ++ (transformListToString t)

-- Function its start the program
main :: IO ()
main = do
	putStrLn "Começando Aplicacao de Filtro!"
	-- Read the image file
	imageFile <- readFile getImagePath
	let header = lines $ take 20 imageFile
	let imageData = drop 20 imageFile
	-- Convert the image data to a list of ints
	let intList = map read $ words imageData :: [Int]
	start <- getCPUTime
	let imageFilterData = applyNegative intList
	end <- getCPUTime
	let diff = (fromIntegral (end - start)) / (10 ^ 12) 
	let imageFilterString = words (transformListToString imageFilterData)
	let imageFilter = unlines $ (header ++ imageFilterString)
	imageFilterFile <- writeFile getImageFilterPath imageFilter
	putStrLn "Filtro Aplicado"
	printf "Tempo Computacional: %0.7f segundos\n" (diff :: Double)