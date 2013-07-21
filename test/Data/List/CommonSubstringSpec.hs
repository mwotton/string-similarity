-- {-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE CPP #-}

module Data.List.CommonSubstringSpec where
import Test.Hspec
import Control.Applicative
import qualified Data.ByteString.Char8 as BS
import Data.List(sortBy,tails)
import Data.Ord

-- this type may not be accurate if there are many equal-length
-- longest common substrings

slowLongestSubstring ::(Eq a, Ord a) => [a] -> [a] -> [a]
slowLongestSubstring first second = head $ reverse $ sortBy (comparing length) comparisons
  where comparisons = concatMap (\x -> map (sharedPrefix x) $ tails second) (tails first)


sharedPrefix :: (Eq a, Ord a) => [a] -> [a] -> [a]
sharedPrefix (a:as) (b:bs)
  | a==b = a:sharedPrefix as bs
  | otherwise = []
sharedPrefix _ _ = []

spec :: Spec
spec = describe "common substring" $ do
  it "shared prefix" $ do
    sharedPrefix "aab" "aac" `shouldBe` "aa"
    sharedPrefix "baab" "aac" `shouldBe` ""

  it "is sane" $ do
    slowLongestSubstring "abbd" "cbbe" `shouldBe` "bb"
    slowLongestSubstring "abbd" "fghij" `shouldBe` "a"
