---
author: "volyx"
title:  "Unique Paths"
date: "2020-06-09"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dp", "repeat"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

How many possible unique paths are there?

![ex1](/images/2020-06-09-ex1.png)

Above is a 7 x 3 grid. How many possible unique paths are there?

```txt
Example 1:

Input: m = 3, n = 2
Output: 3
Explanation:
From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
1. Right -> Right -> Down
2. Right -> Down -> Right
3. Down -> Right -> Right

Example 2:

Input: m = 7, n = 3
Output: 28
```

Constraints:

- 1 <= m, n <= 100
- It's guaranteed that the answer will be less than or equal to 2 * 10 ^ 9.

Solution:

```java
class Solution {
    public int uniquePaths(int m, int n) {
        int[][] dp = new int[n][m];
        Arrays.fill(dp[0], 1);
        for (int i = 1; i < n; i++) {
            for (int j = 0; j < m; j++) {
                dp[i][j] += dp[i - 1][j];
                if (j > 0) {
                    dp[i][j] += dp[i][j - 1];
                }
            }
        }
        return dp[n-1][m-1];
    }
}
```

## Solution 2

```java
class Solution {
    public int uniquePaths(int m, int n) {
        int[][] dp = new int[m][n];
        dp[0][0] = 1;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (i == 0 && j == 0) continue;
                if (i > 0) {
                    dp[i][j] += dp[i - 1][j];
                }
                if (j > 0) {
                    dp[i][j] += dp[i][j - 1];
                }
            }
        }
        return dp[m-1][n-1];
    }
}
```
