---
author: "volyx"
title:  "276. Paint Fence"
date: "2021-05-17"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dp"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[276. Paint Fence](https://leetcode.com/problems/paint-fence/)

You are painting a fence of n posts with k different colors. You must paint the posts following these rules:

- Every post must be painted exactly one color.
- At most one pair of adjacent fence posts can have the same color.

Given the two integers n and k, return the number of ways you can paint the fence.

```txt
Example 1:

Input: n = 3, k = 2
Output: 6
Explanation: All the possibilities are shown.
Note that painting all the posts red or all the posts green is invalid because there can only be at most one pair of adjacent posts that are the same color.

Example 2:

Input: n = 1, k = 1
Output: 1

Example 3:

Input: n = 7, k = 2
Output: 42
```

![ex1](/images/2021-05-17-ex1.png)

Constraints:

- 1 <= n <= 50
- 1 <= k <= 105
- The answer is guaranteed to be in the range [0, 231 - 1] for the given n and k.

## Solution

```java
class Solution {
    public int uniquePathsWithObstacles(int[][] obstacleGrid) {
        int n = obstacleGrid.length;
        int m = obstacleGrid[0].length;
        int[][] dp = new int[n][m];
        dp[0][0] = 1;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (obstacleGrid[i][j] == 1) {
                    dp[i][j] = 0;
                    continue;
                }
                if (i > 0 && j > 0) {
                    dp[i][j] = dp[i-1][j]+dp[i][j-1];
                } else if (i > 0) {
                    dp[i][j] = dp[i-1][j];
                } else if (j > 0) {
                    dp[i][j] = dp[i][j-1];
                }
            }
        }
        return dp[n-1][m-1];
    }
}
```
