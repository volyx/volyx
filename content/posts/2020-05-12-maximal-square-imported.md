---
author: "volyx"
title:  "Maximal Square"
date: "2020-05-12"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

Example:

```
Input: 

1 0 1 0 0
1 0 1 1 1
1 1 1 1 1
1 0 0 1 0

Output: 4
```

Solution

![preview](/images/2020-05-12-max-subarray_1_800x.png)

![preview2](/images/2020-05-12-max-subarray2_800x.png)

```java
class Solution {
    public int maximalSquare(char[][] matrix) {
        int n = matrix.length;
        if (n == 0) {
            return 0;
        }
        int m = matrix[0].length;
        int[][] dp = new int[n][m];
        int answer = 0;
        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < m; ++j) {
                if (matrix[i][j] == '1') {
                    dp[i][j] = 1;
                    if (i > 0 && j > 0) {
                        dp[i][j] += Math.min(dp[i - 1][j], Math.min(dp[i][j - 1], dp[i - 1][j - 1]));
                    }
                    answer = Math.max(answer, dp[i][j]);
                }
            }
        }
        return answer * answer;
    }
}
