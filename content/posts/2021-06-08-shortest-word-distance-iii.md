---
author: "volyx"
title:  "245. Shortest Word Distance III"
date: "2021-06-08"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array","string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[245. Shortest Word Distance III](https://leetcode.com/problems/shortest-word-distance-iii/)

Given an array of strings wordsDict and two strings that already exist in the array word1 and word2, return the shortest distance between these two words in the list.

Note that word1 and word2 may be the same. It is guaranteed that they represent two individual words in the list.

```txt
Example 1:

Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "makes", word2 = "coding"
Output: 1

Example 2:

Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "makes", word2 = "makes"
Output: 3
```

Constraints:

- 1 <= wordsDict.length <= 3 * 104
- 1 <= wordsDict[i].length <= 10
- wordsDict[i] consists of lowercase English letters.
- word1 and word2 are in wordsDict.

## Solution

```java
class Solution {
    public int shortestWordDistance(String[] wordsDict, String word1, String word2) {
        Map<String, List<Integer>> map = new HashMap<>();
        for (int i = 0; i < wordsDict.length; i++) {
            String word = wordsDict[i];
            List<Integer> indexes = map.getOrDefault(word, new ArrayList<>());
            indexes.add(i);
            map.put(word, indexes);
        }
        
        int min = Integer.MAX_VALUE;
        for (Integer idx1: map.get(word1)) {
            for (Integer idx2: map.get(word2)) {
                if (idx1 != idx2) {
                    min = Math.min(min, Math.abs(idx1 - idx2));
                }
            }
        }
        return min;
    }
}
```
