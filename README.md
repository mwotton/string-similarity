string-similarity
=================

This is a collection of algorithms for finding the longest common
substring in two documents.

The wider aim is to rate pairs (and eventually, larger sets) of
documents for similarity, so that we can semi-automatically determine
relationships in datasets. For the moment, just


    longestSubstring ::(Eq a, Ord a) -> [a] -> [a] -> [a]

will do.