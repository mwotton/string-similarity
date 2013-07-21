-- {-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE CPP #-}

module Data.List.CommonSubstringSpec where
import Test.Hspec
import Control.Applicative
import qualified Data.ByteString.Char8 as BS

import Control.Monad(forM_)
import qualified Data.List.CommonSubstring as Suffix
import qualified Data.List.SlowSubstring as Slow

-- this type may not be accurate if there are many equal-length
-- longest common substrings





spec :: Spec
spec = describe "common substring" $ do
  describe "suffixtree implementation" $ do
    let samples = [("abcd", "aaaabcd")]
    forM_ [("suffixtree", Suffix.longestSubstring)] $ \(label,f) ->
      it ("should work for " ++ label) $
        forM_ samples $ \(first, second) ->
          f first second `shouldBe` Slow.longestSubstring first second
