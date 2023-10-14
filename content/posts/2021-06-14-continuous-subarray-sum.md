---
author: "volyx"
title:  "523. Continuous Subarray Sum"
date: "2021-06-14"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "prefix-sum"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[523. Continuous Subarray Sum](https://leetcode.com/problems/continuous-subarray-sum/)

Given an integer array nums and an integer k, return true if nums has a continuous subarray of size at least two whose elements sum up to a multiple of k, or false otherwise.

An integer x is a multiple of k if there exists an integer n such that x = n * k. 0 is always a multiple of k.

```txt
Example 1:

Input: nums = [23,2,4,6,7], k = 6
Output: true
Explanation: [2, 4] is a continuous subarray of size 2 whose elements sum up to 6.

Example 2:

Input: nums = [23,2,6,4,7], k = 6
Output: true
Explanation: [23, 2, 6, 4, 7] is an continuous subarray of size 5 whose elements sum up to 42.
42 is a multiple of 6 because 42 = 7 * 6 and 7 is an integer.

Example 3:

Input: nums = [23,2,6,4,7], k = 13
Output: false
```

Constraints:

- 1 <= nums.length <= 105
- 0 <= nums[i] <= 109
- 0 <= sum(nums[i]) <= 231 - 1
- 1 <= k <= 231 - 1

## Solution

```java
class Solution {
    public boolean checkSubarraySum(int[] nums, int k) {
        Map<Integer, Integer> prefix = new HashMap<>();
        prefix.put(0, -1);
        int sum = 0;
        for (int i = 0; i < nums.length; i++) {
            sum += nums[i];
            sum = sum % k;
            Integer prev = prefix.get(sum);
            
            if (prev != null) {
                if ((i - prev) > 1) return true;
            } else {
                prefix.put(sum, i);
            }
        }
        
        return false;
    }
    
    /*
    [23, 2, 4,6,7], k = 6
    [23,25,29,35,42]
    [5, 1, 5, 5, 0]
    
    5, 1, 5,
          ^
    
    5: 0
    1: 1
    
    [0-2]
    
    
    
    */
}
```

## Solution 2

```java
class Solution {
    public boolean checkSubarraySum(int[] nums, int k) {
        int n = nums.length;
        Map<Integer, Integer> map = new HashMap<>();
        int[] prefix = new int[n];
        map.put(0, 0);
        int sum = 0;
        for (int i = 0; i < prefix.length; i++) {
            sum += nums[i];
            prefix[i] = sum;
            prefix[i] %= k;
            Integer prev = map.get(prefix[i]);
            if (prev != null) {
                if ((i - prev) > 1) return true;
            } else {
                map.put(prefix[i], i);
            }
        }
        return false;
    }
}
```

## Solution 2021-01-26

```java
class Solution {
    public boolean checkSubarraySum(int[] nums, int k) {
        int n = nums.length;
        Map<Integer, Integer> prefix = new HashMap<>();
        prefix.put(0, -1);
        int sum = 0;
        for (int i = 0; i < n; i++) {
            sum += nums[i];
            sum = sum % k;
            Integer prev = prefix.get(sum);
            if (prev != null) {
                if (i - prev > 1) {
                    return true;
                }
            } else {
                prefix.put(sum, i);
            }
        }
        return false;
    }
}
```
