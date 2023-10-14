---
author: "volyx"
title:  "221. Maximal Square"
date: "2021-05-28"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dp"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[221. Maximal Square](https://leetcode.com/problems/maximal-square/)

Given an m x n binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

```txt
Example 1:

Input: matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
Output: 4
```

```txt
Example 2:

Input: matrix = [["0","1"],["1","0"]]
Output: 1
```

```txt
Example 3:

Input: matrix = [["0"]]
Output: 0
```

Constraints:

- m == matrix.length
- n == matrix[i].length
- 1 <= m, n <= 300
- matrix[i][j] is '0' or '1'.

## Solution

```java
class Solution {
    public int maximalSquare(char[][] matrix) {
        int n = matrix.length;
        int m = matrix[0].length;
        int[][] dp = new int[n][m];
        int max = 0;
        for (int j = 0; j < m; j++) {
            dp[0][j] = matrix[0][j] == '0' ? 0 : 1;
            max = Math.max(dp[0][j], max);
        }
        
        for (int i = 0; i < n; i++) {
            dp[i][0] = matrix[i][0] == '0' ? 0: 1;
            max = Math.max(dp[i][0], max);
        }
        
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                if (matrix[i][j] == '0') {
                    dp[i][j] = 0;
                } else {
                    dp[i][j] = min(dp[i-1][j],dp[i][j-1],dp[i-1][j-1]) + 1;
                }
                max = Math.max(dp[i][j], max);
            }
        }   
        return max * max;
    }
    
    int min(int a, int b, int c) {
        return Math.min(a, Math.min(b,c));
    }
}
```
