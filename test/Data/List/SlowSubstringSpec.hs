module Data.List.SlowSubstringSpec where
import qualified Data.List.SlowSubstring as Slow
import Test.Hspec

spec = describe "slow substring" $ do
  it "shared prefix" $ do
    Slow.sharedPrefix "aab" "aac" `shouldBe` "aa"
    Slow.sharedPrefix "baab" "aac" `shouldBe` ""

  it "is sane" $ do
    Slow.longestSubstring "abbd" "cbbe" `shouldBe` "bb"
    Slow.longestSubstring "abbd" "fghij" `shouldBe` ""
