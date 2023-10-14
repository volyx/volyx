---
author: "volyx"
title:  "243. Shortest Word Distance"
date: "2021-06-08"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[243. Shortest Word Distance](https://leetcode.com/problems/shortest-word-distance/)

Given an array of strings wordsDict and two different strings that already exist in the array word1 and word2, return the shortest distance between these two words in the list.

```txt
Example 1:

Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "coding", word2 = "practice"
Output: 3

Example 2:

Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "makes", word2 = "coding"
Output: 1
```

Constraints:

- 1 <= wordsDict.length <= 3 * 104
- 1 <= wordsDict[i].length <= 10
- wordsDict[i] consists of lowercase English letters.
- word1 and word2 are in wordsDict.
- word1 != word2

## Solution

```java
class Solution {
    public int shortestDistance(String[] wordsDict, String word1, String word2) {
        int first = -1;
        int second = -1;
        int min = wordsDict.length;
        for (int i = 0; i < wordsDict.length; i++) {
            if (wordsDict[i].equals(word1)) {
                first = i; 
            }
            if (wordsDict[i].equals(word2)) {
                second = i;
            }
            if (first != -1 && second != -1) {
                min = Math.min(min, Math.abs(first - second));
            }
        }
        return min;
    }
}
```
