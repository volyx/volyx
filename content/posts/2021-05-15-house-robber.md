---
author: "volyx"
title:  "198. House Robber"
date: "2021-05-15"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dp"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[198. House Robber](https://leetcode.com/problems/house-robber/)

You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

```txt
Example 1:

Input: nums = [1,2,3,1]
Output: 4
Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
Total amount you can rob = 1 + 3 = 4.

Example 2:

Input: nums = [2,7,9,3,1]
Output: 12
Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
Total amount you can rob = 2 + 9 + 1 = 12.
```

Constraints:

- 1 <= nums.length <= 100
- 0 <= nums[i] <= 400

## Solution

```java
class Solution {
    public int rob(int[] nums) {
        int n = nums.length;
        if (n == 1) return nums[0];
        int[] dp = new int[n + 1];
        dp[0] = nums[0];
        dp[1] = nums[1];
        int max = Math.max(dp[0], dp[1]);
        for (int i = 2; i < n + 1; i++) {
            int value = (i < n) ? nums[i]: 0;
            for (int j = i - 2; j >= 0; j--) {
                dp[i] = Math.max(dp[j] + value, dp[i]);
            }
            max = Math.max(dp[i], max);
        }
        return max;
    }
}
```
