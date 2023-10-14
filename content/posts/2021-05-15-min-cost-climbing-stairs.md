---
author: "volyx"
title:  "746. Min Cost Climbing Stairs"
date: "2021-05-15"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "dp"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[746. Min Cost Climbing Stairs](https://leetcode.com/problems/min-cost-climbing-stairs/)

You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.

You can either start from the step with index 0, or the step with index 1.

Return the minimum cost to reach the top of the floor.

```txt
Example 1:

Input: cost = [10,15,20]
Output: 15
Explanation: Cheapest is: start on cost[1], pay that cost, and go to the top.

Example 2:

Input: cost = [1,100,1,1,1,100,1,1,100,1]
Output: 6
Explanation: Cheapest is: start on cost[0], and only step on 1s, skipping cost[3].
```

Constraints:

- 2 <= cost.length <= 1000
- 0 <= cost[i] <= 999

## Solution

```java
class Solution {
    public int minCostClimbingStairs2(int[] cost) {
        int n = cost.length;
        int[] dp = new int[n + 1];
        dp[0] = cost[0];
        dp[1] = cost[1];
        
        for (int i = 2; i < n + 1; i++) {
            int value = i < n ? cost[i]: 0;
            dp[i] = value + Math.min(dp[i - 1], dp[i - 2]);
        }
        
        return dp[n];
    }
    
    // [a, b, c]
    // [..,a, b, c]
    //
    public int minCostClimbingStairs(int[] cost) {
        int n = cost.length;
        int a = 0;
        int b = 0;
        int curr = 0;
        for (int i = 0; i < n + 1; i++) {
            int value = i < n ? cost[i]: 0;
            curr = value + Math.min(a, b);
            a = b;
            b = curr;
        }
        return curr;
    }
}
```
