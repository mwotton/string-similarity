module Main where
import Criterion.Main

import qualified Data.List.CommonSubstring as Suffix
import qualified Data.List.SlowSubstring as Slow

padlen = 1000

first = padding ++ "bbbbbbbb" ++ padding
  where  padding = concat $ replicate padlen  "abcd"

second = padding ++ "bbbbbbb" ++ padding
  where  padding = concat (replicate padlen "efgh")

main = defaultMain [
        bgroup "string-similarity"
          [ --bench "slow" $ whnf (Slow.longestSubstring first) second
            bench "common" $ whnf (Suffix.longestSubstring first) second
          ]
        ]
