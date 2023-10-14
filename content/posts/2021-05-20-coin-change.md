---
author: "volyx"
title:  "322. Coin Change"
date: "2021-05-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dp", "tabulation"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[322. Coin Change](https://leetcode.com/problems/word-break/)

You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

You may assume that you have an infinite number of each kind of coin.

```txt
Example 1:

Input: coins = [1,2,5], amount = 11
Output: 3
Explanation: 11 = 5 + 5 + 1

Example 2:

Input: coins = [2], amount = 3
Output: -1

Example 3:

Input: coins = [1], amount = 0
Output: 0

Example 4:

Input: coins = [1], amount = 1
Output: 1

Example 5:

Input: coins = [1], amount = 2
Output: 2
```

Constraints:

- 1 <= coins.length <= 12
- 1 <= coins[i] <= 231 - 1
- 0 <= amount <= 104

## Solution

```java
class Solution {
    public int coinChange(int[] coins, int n) {
        int[] dp = new int[n + 1];
        Arrays.fill(dp, 10_000);
        dp[0] = 0;
        for (int i = 1; i < n + 1; i++) {
            for (int coin: coins) {
                if (i - coin >= 0) {
                    if (dp[i-coin] == 10_000) {
                        continue;
                    }
                    dp[i] = Math.min(dp[i-coin] + 1, dp[i]);
                }
            }
        }
        System.out.println(Arrays.toString(dp));
        return dp[n] == 10_000 ? -1: dp[n];
    }
}
```
