---
author: "volyx"
title:  "279. Perfect Squares"
date: "2020-06-29"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dp"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![279. Perfect Squares](https://leetcode.com/problems/perfect-squares/)

Given a positive integer n, find the least number of perfect square numbers (for example, 1, 4, 9, 16, ...) which sum to n.

```txt
Example 1:

Input: n = 12
Output: 3 
Explanation: 12 = 4 + 4 + 4.
```

```txt
Example 2:

Input: n = 13
Output: 2
Explanation: 13 = 4 + 9.
```

## Solution

```java
class Solution {
    public int numSquares(int n) {
        int[] dp = new int[n + 1];
        dp[0] = 0;
        dp[1] = 1;
        for (int i = 2; i < dp.length; i++) {
            dp[i] = Integer.MAX_VALUE;
            for (int j = 1; j * j <= i; j++) {
                dp[i] = Math.min(dp[i], dp[i - j * j] + 1);
            }
        }
        return dp[n];
    }
}
```

## Solution 2021-11-30

```java
class Solution {
    public int numSquares(int n) {
        
        int[] dp = new int[n + 1];
        Arrays.fill(dp, Integer.MAX_VALUE);
        dp[0] = 0;
        
        int max_square_index = (int) Math.sqrt(n) + 1;
        int[] squares = new int[max_square_index];
        for (int i = 1; i < squares.length; i++) {
            squares[i] = i * i;
        }
        
        for (int i = 1; i < dp.length; i++) {
            for (int j = max_square_index - 1; j > 0; j--) {
                if (i - squares[j] >= 0) {
                    int at = i - squares[j];
                    dp[i] = Math.min(dp[i], dp[at] + 1);
                }
            }
        }       
        return dp[n];
    }
}
```
