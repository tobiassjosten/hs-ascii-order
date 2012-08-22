module Main where

import Data.Char
import Data.List
import System.Environment
import System.IO

main = do
	args <- getArgs
	putStrLn $ unlines $ map merger $ wordsSorted $ unwords args
	where
		merger = (\(val, str) -> show val ++ " " ++ str)

wordsSorted :: String -> [(Int, String)]
wordsSorted str = sortBy sorter vals
	where
		vals = wordsValues $ words str
		sorter = (\(a, _) (b, _) -> compare a b)

wordsValues :: [String] -> [(Int, String)]
wordsValues [] = []
wordsValues xs = wordsValues' xs []

wordsValues' :: [String] -> [(Int, String)] -> [(Int, String)]
wordsValues' [] vals = vals
wordsValues' (h:xs) vals = wordsValues' xs $ (wordValue h):vals

wordValue :: String -> (Int, String)
wordValue str = (round $ val / size, str)
	where
		val = toRational $ wordValue' str 0
		size = toRational $ length str

wordValue' :: String -> Int -> Int
wordValue' "" val = val
wordValue' (h:xs) val = ord h + wordValue' xs val
