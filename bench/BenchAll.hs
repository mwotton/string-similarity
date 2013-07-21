module Main where
import Criterion.Main

import qualified Data.List.CommonSubstring as Suffix
import qualified Data.List.SlowSubstring as Slow

first padlen = padding ++ "bbbbbbbb" ++ padding
  where  padding = concat $ replicate padlen  "abcd"

second padlen = padding ++ "bbbbbbb" ++ padding
  where  padding = concat (replicate padlen "efgh")

main = defaultMain [
        bgroup "string-similarity"
         [ bench "slow" $ whnf (Slow.longestSubstring $ first 100) (second 100),
           bench "common" $ whnf (Suffix.longestSubstring $ first 100) (second 100),
           bench "common" $ whnf (Suffix.longestSubstring $ first 1000) (second 1000),
           bench "common" $ whnf (Suffix.longestSubstring $ first 10000) (second 10000)
         ]
        ]
