---
author: "volyx"
title:  "Toeplitz Matrix"
date: "2020-06-09"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

A matrix is Toeplitz if every diagonal from top-left to bottom-right has the same element.

Now given an M x N matrix, return True if and only if the matrix is Toeplitz.


Example 1:
```
Input:
matrix = [
  [1,2,3,4],
  [5,1,2,3],
  [9,5,1,2]
]
Output: True
Explanation:
In the above grid, the diagonals are:
"[9]", "[5, 5]", "[1, 1, 1]", "[2, 2, 2]", "[3, 3]", "[4]".
In each diagonal all elements are the same, so the answer is True.
```

Example 2:
```
Input:
matrix = [
  [1,2],
  [2,2]
]
Output: False
Explanation:
The diagonal "[1, 2]" has different elements.
```

Note:

- matrix will be a 2D array of integers.
- matrix will have a number of rows and columns in range [1, 20].
- matrix[i][j] will be integers in range [0, 99].

Follow up:

- What if the matrix is stored on disk, and the memory is limited such that you can only load at most one row of the matrix into the memory at once?
- What if the matrix is so large that you can only load up a partial row into the memory at once?

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
