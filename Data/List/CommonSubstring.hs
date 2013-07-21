module Data.List.CommonSubstring where
import Data.SuffixTree
import Data.List
import Data.Ord

longestSubstring ::(Eq a, Ord a) => [a] -> [a] -> [a]
longestSubstring first second = head $ reverse $ sortBy (comparing length)
                                     $ map (longestMatch $ construct second)
                                     $ tails first
  where longestMatch :: Eq a => STree a -> [a] -> [a]
        longestMatch Leaf _ = []
        longestMatch (Node edges) candidate =
          head $ reverse $ sortBy (comparing length) $ map (prefixMatch candidate) edges

        prefixMatch :: Eq a => [a] -> Edge a -> [a]
        prefixMatch candidate (p, tree)
          | p' `isPrefixOf` candidate = p' ++ longestMatch tree (drop (length p') candidate)
          | otherwise = commonSubstring p' candidate
          where p' = prefix p
        commonSubstring (a:as) (b:bs)
          | a==b = a:(commonSubstring as bs)
          | otherwise = []
        commonSubstring _ _ = []
