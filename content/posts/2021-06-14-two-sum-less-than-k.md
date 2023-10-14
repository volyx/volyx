---
author: "volyx"
title:  "1099. Two Sum Less Than K"
date: "2021-06-14"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array","twosum"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1099. Two Sum Less Than K](https://leetcode.com/problems/two-sum-less-than-k/)

Given an array nums of integers and integer k, return the maximum sum such that there exists i < j with nums[i] + nums[j] = sum and sum < k. If no i, j exist satisfying this equation, return -1.

```txt
Example 1:

Input: nums = [34,23,1,24,75,33,54,8], k = 60
Output: 58
Explanation: We can use 34 and 24 to sum 58 which is less than 60.

Example 2:

Input: nums = [10,20,30], k = 15
Output: -1
Explanation: In this case it is not possible to get a pair sum less that 15.
```

Constraints:

- 1 <= nums.length <= 100
- 1 <= nums[i] <= 1000
- 1 <= k <= 2000

## Solution

```java
class Solution {
    public int twoSumLessThanK(int[] nums, int k) {
        TreeSet<Integer> set = new TreeSet<>();
        int max = -1;
        for (int i = 0; i < nums.length; i++) {
            int num = nums[i];
            Integer pre = set.lower(k - num);
            
            if (pre != null) {
                max = Math.max(pre + num, max);
            }
            set.add(num);
        }
        
        return max;
    }
}
```
