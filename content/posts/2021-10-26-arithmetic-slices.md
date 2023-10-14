---
author: "volyx"
title:  "413. Arithmetic Slices"
date: "2021-10-26"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array", "dp"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![413. Arithmetic Slices](https://leetcode.com/problems/arithmetic-slices/)

An integer array is called arithmetic if it consists of at least three elements and if the difference between any two consecutive elements is the same.

For example, [1,3,5,7,9], [7,7,7,7], and [3,-1,-5,-9] are arithmetic sequences.

Given an integer array nums, return the number of arithmetic subarrays of nums.

A subarray is a contiguous subsequence of the array.

```txt
Example 1:

Input: nums = [1,2,3,4]
Output: 3
Explanation: We have 3 arithmetic slices in nums: [1, 2, 3], [2, 3, 4] and [1,2,3,4] itself.

Example 2:

Input: nums = [1]
Output: 0
```

Constraints:

- 1 <= nums.length <= 5000
- -1000 <= nums[i] <= 1000

## Solution Brute Force

```java
class Solution {
    public int numberOfArithmeticSlices2(int[] nums) {
        if (nums.length < 3) {
            return 0;
        }
        int count = 0;
        for (int i = 0; i < nums.length - 2; i++) {
            int delta = nums[i] - nums[i+1] ;
            if (delta == nums[i + 1] - nums[i+2]) {
                count++;
                int j = i + 2;
                while (j + 1 < nums.length && delta == nums[j] - nums[j+1]) {
                    count++;
                    j++;
                }
            }
        }
        return count;
    }
}
 ```

## Solution DP

```java
class Solution {
    /*
    
    123456
    123456
    
    112345
    
    123 1234 12345 123456
    
    234 2345 23456
    
    345 3456
    
    456
    
    */
    public int numberOfArithmeticSlices(int[] nums) {
        int[] dp = new int[nums.length];
        int sum = 0;
        for (int i = 2; i < nums.length; i++) {
            if (nums[i] - nums[i - 1] == nums[i - 1] - nums[i - 2]) {
                dp[i] = dp[i - 1] + 1;
                sum += dp[i];
            }
        }
        return sum;
    }
}
 ```
