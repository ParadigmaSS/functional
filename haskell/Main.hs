module Main where

import System.CPUTime
import Text.Printf
import Filter (applyNegative, transformListToString)
import Image (getImagePath, getImageFilterPath, loadImage, recordImage)

-- Function its start the program
main :: IO ()
main = do
	putStrLn "Começando Aplicacao de Filtro!"
	imageFile <- loadImage
	-- Start conting the time of processing
	start <- getCPUTime
	-- Save the header of file
	let header = lines $ take 20 imageFile
	-- Save the data of file
	let imageData = drop 20 imageFile
	-- Convert the image data to a list of ints
	let intList = map read $ words imageData :: [Int]
	-- Applies the negative filter
	let imageFilterData = applyNegative intList
	-- Transform the negative data list on a string
	let imageFilterString = words (transformListToString imageFilterData)
	let imageFilter = unlines $ (header ++ imageFilterString)
	-- End conting the time of processing
	end <- getCPUTime
	-- Get the diff of end and start time of processing
	let diff = (fromIntegral (end - start)) / (10 ^ 12) 
	imageFilterFile <- recordImage imageFilter
	putStrLn "Filtro Aplicado"
	printf "Tempo Computacional: %0.6f segundos\n" (diff :: Double)