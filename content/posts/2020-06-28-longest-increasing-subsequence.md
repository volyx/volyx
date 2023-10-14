---
author: "volyx"
title:  "Longest Increasing Subsequence"
date: "2020-06-28"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given an unsorted array of integers, find the length of longest increasing subsequence.

```txt
Example:

Input: [10,9,2,5,3,7,101,18]
Output: 4 
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4. 
```

Note:
- There may be more than one LIS combination, it is only necessary for you to return the length.
- Your algorithm should run in O(n2) complexity.

Follow up: Could you improve it to O(n log n) time complexity?

## Recursive O(2^n) Solution:

```java
class Solution {
    public int lengthOfLIS(int[] nums) {
        return lengthOfLIS(nums, Integer.MIN_VALUE, 0);
    }
    
    int lengthOfLIS(int[] nums, int prev, int currpos) {
        
        if (currpos == nums.length) {
            return 0;
        }
        
        int taken = 0;
        if (nums[currpos] > prev) {
            taken = 1 + lengthOfLIS(nums, nums[currpos], currpos + 1);
        }
        
        int nottaken = lengthOfLIS(nums, prev, currpos + 1);
        
        return Math.max(nottaken, taken);
    }
}
```

## Recursive O(n*n) Solution with Memoization:

```java
class Solution {
    public int lengthOfLIS(int[] nums) {
        int[][] memo = new int[nums.length + 1][nums.length];
        for (int[] l: memo) {
            Arrays.fill(l, -1);
        }
        return lengthOfLIS(nums, -1, 0, memo);
    }
    
    int lengthOfLIS(int[] nums, int prevpos, int currpos, int[][] memo) {
        
        if (currpos == nums.length) {
            return 0;
        }
        
        if (memo[prevpos + 1][currpos] >= 0) {
            return memo[prevpos + 1][currpos];
        } 
        
        int taken = 0;
        if (prevpos < 0 || nums[currpos] > nums[prevpos]) {
            taken = 1 + lengthOfLIS(nums, currpos, currpos + 1, memo);
        }
        
        int nottaken = lengthOfLIS(nums, prevpos, currpos + 1, memo);
        memo[prevpos + 1][currpos] = Math.max(nottaken, taken); 
           
        return  memo[prevpos + 1][currpos];
    }
}
```

Solution:

```java
class Solution {
    public int lengthOfLIS(int[] nums) {
        int n = nums.length;
        if (n <= 1) {
            return n;
        }
        int[] dp = new int[n];
        Arrays.fill(dp, 1);
        int ans = 1;
        for (int i = 1; i < n; i++) {
            for (int j = i - 1; j >=0; j--) {
                if (nums[i] > nums[j]) {
                    dp[i] = Math.max(dp[i], dp[j] + 1);
                } 
                ans = Math.max(ans, dp[i]);
            }
        }
        System.out.println(Arrays.toString(dp));
        return ans;
    }
}
```

## Solution 2021-11-26

```java
class Solution {
    public int lengthOfLIS(int[] nums) {
        int n = nums.length;
        
        int[] len = new int[n];
        Arrays.fill(len, 1);
        int max = 1;
        for (int i = 1; i < n; i++) {
            
            for (int j = 0; j < i; j++) {
                if (nums[i] > nums[j]) {
                    len[i] = Math.max(len[i], len[j] + 1);
                    max = Math.max(len[i], max);
                }
            }
        }
        
        return max;
    }
}
```
