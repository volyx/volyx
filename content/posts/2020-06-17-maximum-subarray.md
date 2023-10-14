---
author: "volyx"
title:  "53. Maximum Subarray"
date: "2020-06-17"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![53. Maximum Subarray](https://leetcode.com/problems/maximum-subarray/)

Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

Example:

```txt
Input: [-2,1,-3,4,-1,2,1,-5,4],
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.
```

Follow up:

- If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

Solution:

```java
class Solution {
    public int maxSubArray(int[] nums) {
        if (nums.length == 1) {
            return nums[0];
        }
        int dp = nums[0];
        int answer = nums[0];
        for (int i = 1; i < nums.length; i++) {
            dp = Math.max(dp, 0) + nums[i];
            answer = Math.max(answer, dp);
        }
        return answer;
    }
}
```

## Solution 2021-11-20

```java
class Solution {
    public int maxSubArray(int[] nums) {
        int n = nums.length;
        int[] dp = new int[n];
        int max = nums[0];
        for (int i = 0; i < n; i++) {
            if (i == 0) {
                dp[i] = nums[i];
            } else {
                dp[i] = Math.max(nums[i], dp[i - 1] + nums[i]);
                max = Math.max(dp[i], max);
            }
        }
        return max;
    }
}
```
