module Filter 
( applyNegative
, transformListToString
) where

-- Function which applies the negative filter on image
applyNegative :: [Int] -> [Int]
-- Verify if list is empty
applyNegative [] = []
-- Modify the header of list and pass to the tail list
applyNegative (h:t) = 255 - h : (applyNegative t)

-- Function which convert a list of int to a string
transformListToString :: [Int] -> String
-- Verify if list is empty
transformListToString [] = ""
-- Convert the head to string, add a white space and convert the tail of list
transformListToString (h:t) = show h ++ " " ++ (transformListToString t)