---
author: "volyx"
title:  "Coin Change 2"
date: "2020-06-08"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dp"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

You are given coins of different denominations and a total amount of money. Write a function to compute the number of combinations that make up that amount. You may assume that you have infinite number of each kind of coin.

```txt
Example 1:

Input: amount = 5, coins = [1, 2, 5]
Output: 4
Explanation: there are four ways to make up the amount:
5=5
5=2+2+1
5=2+1+1+1
5=1+1+1+1+1

Example 2:

Input: amount = 3, coins = [2]
Output: 0
Explanation: the amount of 3 cannot be made up just with coins of 2.

Example 3:

Input: amount = 10, coins = [10] 
Output: 1
```

Note:

You can assume that

- 0 <= amount <= 5000
- 1 <= coin <= 5000
- the number of coins is less than 500
- the answer is guaranteed to fit into signed 32-bit integer

## Recursive Solution

```java
class Solution {
    public int change(int amount, int[] coins) {
        return change(0, amount, coins);
    }
    int change(int k, int amount, int[] coins) {
        if (amount == 0) return 1;
        if (amount < 0 || k == coins.length) return 0;
        return change(k, amount - coins[k], coins) + change(k + 1, amount, coins);
    }
}
```

## Recursive with Memo

```java
class Solution {
    public int change(int amount, int[] coins) {
        int[][] dp = new int[coins.length][amount + 1];
        for (int i = 0; i < coins.length; i++) {
            Arrays.fill(dp[i], -1);
        }
        return change(0, amount, coins, dp);
    }
    
    int change(int k, int amount, int[] coins, int[][] dp) {
        if (amount == 0) return 1;
        if (amount < 0 || k == coins.length) return 0;
        if (dp[k][amount] != -1) return dp[k][amount];
        return dp[k][amount] = change(k, amount - coins[k], coins, dp) + change(k + 1, amount, coins, dp);
    }
}
```

## DP Solution

```java
class Solution {
    public int change(int amount, int[] coins) {
       int[][] dp = new int[coins.length + 1][amount + 1];
        for (int i = 0 ; i <= coins.length; i++) {
            dp[i][0] = 1;
        }
        for (int i = 1; i <= coins.length; i++) {
            for (int j = 1; j <= amount; j++) {
               if (j >= coins[i-1]) {
                 dp[i][j] = dp[i][j - coins[i-1]] + dp[i-1][j];
               } else {
                 dp[i][j] = dp[i-1][j];
               }
            }
        }
        return dp[coins.length][amount];
    }
}
```

## One Dimensionl DP

```java
class Solution {
    public int change(int amount, int[] coins) {
        int[] dp = new int[amount + 1];
        dp[0] = 1;
       
        for (int coin: coins) {
            for (int i = coin; i < dp.length; i++) {
                if (i - coin >= 0) {
                    dp[i] += dp[i - coin];
                }
            }
        }
        
        return dp[amount];
    }
}
```
