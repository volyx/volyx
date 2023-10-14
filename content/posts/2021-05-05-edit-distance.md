---
author: "volyx"
title:  "72. Edit Distance"
date: "2021-05-05"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "string", "dp", "edit-distance"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[72. Edit Distance](https://leetcode.com/problems/edit-distance/)

Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.

You have the following three operations permitted on a word:

- Insert a character
- Delete a character
- Replace a character

```txt
Example 1:

Input: word1 = "horse", word2 = "ros"
Output: 3
Explanation: 
horse -> rorse (replace 'h' with 'r')
rorse -> rose (remove 'r')
rose -> ros (remove 'e')
```

```txt
Example 2:

Input: word1 = "intention", word2 = "execution"
Output: 5
Explanation: 
intention -> inention (remove 't')
inention -> enention (replace 'i' with 'e')
enention -> exention (replace 'n' with 'x')
exention -> exection (replace 'n' with 'c')
exection -> execution (insert 'u')
```

Constraints:

- 0 <= word1.length, word2.length <= 500
- word1 and word2 consist of lowercase English letters.

## Solution

```java
class Solution {
    public int minDistance(String word1, String word2) {
        int n = word1.length();
        int m = word2.length();
        
        int[][] d = new int[n + 1][m + 1];
        
        for (int i = 0; i < n + 1; i++) {
            d[i][0] = i;
        }
        
        for (int i = 0; i < m + 1; i++) {
            d[0][i] = i;
        }
        for (int i = 1; i < n + 1; i++) {
            for (int j = 1; j < m + 1; j++) {
                int editCost = Math.min(d[i - 1][j] + 1, d[i][j - 1] + 1);
                int diff = (word1.charAt(i - 1) == word2.charAt(j - 1)) ? 0: 1;
                d[i][j] = Math.min(editCost, d[i - 1][ j - 1] + diff);
            }
        }
        return d[n][m];
    }
}
```
