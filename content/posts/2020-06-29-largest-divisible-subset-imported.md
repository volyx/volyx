---
author: "volyx"
title:  "Largest Divisible Subset"
date: "2020-06-29"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a set of distinct positive integers, find the largest subset such that every pair (Si, Sj) of elements in this subset satisfies:

Si % Sj = 0 or Sj % Si = 0.

If there are multiple solutions, return any subset is fine.

Example 1:

Input: [1,2,3]
Output: [1,2] (of course, [1,3] will also be ok)

Example 2:

Input: [1,2,4,8]
Output: [1,2,4,8]


Solution:

```java
class Solution {
    public List<Integer> largestDivisibleSubset(int[] nums) {
        int n = nums.length ;
        if (n== 0) {
            return Collections.emptyList();
        }
        Arrays.sort(nums);
        int[] dp = new int[n];
        dp[0] = 1;
        int ans = 1;
        for (int i = 1; i < n; i++) {
            for (int j = 0; j < i; j++) {
                if (nums[i] % nums[j] == 0) {
                    dp[i] = Math.max(dp[i], dp[j] + 1);
                    ans = Math.max(ans, dp[i]);
                }
            }
        }
       
        int prev = -1;
        List<Integer> result = new ArrayList<>();
        for (int i = n - 1; i >= 0; i--) {
            if (dp[i] == ans && (prev == -1 || prev % nums[i] == 0)) {
                prev = nums[i];
                ans--;
                result.add(nums[i]);
            }
        }
        
        Collections.sort(result);
        
        return result;
        
    }
}
