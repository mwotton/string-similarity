module Data.List.SlowSubstring(longestSubstring,sharedPrefix) where
import Data.List(sortBy,tails)
import Data.Ord

longestSubstring ::(Eq a, Ord a) => [a] -> [a] -> [a]
longestSubstring first second = head $ reverse $ sortBy (comparing length) comparisons
  where comparisons = concatMap (\x -> map (sharedPrefix x) $ tails second) (tails first)

sharedPrefix :: (Eq a, Ord a) => [a] -> [a] -> [a]
sharedPrefix (a:as) (b:bs)
  | a==b = a:sharedPrefix as bs
  | otherwise = []
sharedPrefix _ _ = []
