---
author: "volyx"
title:  "974. Subarray Sums Divisible by K"
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

[974. Subarray Sums Divisible by K](https://leetcode.com/problems/subarray-sums-divisible-by-k/)

Given an array nums of integers, return the number of (contiguous, non-empty) subarrays that have a sum divisible by k.

```txt
Example 1:

Input: nums = [4,5,0,-2,-3,1], k = 5
Output: 7
Explanation: There are 7 subarrays with a sum divisible by k = 5:
[4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3]
```

Note:

- 1 <= nums.length <= 30000
- -10000 <= nums[i] <= 10000
- 2 <= k <= 10000

## Solution

```java
class Solution {
    public int subarraysDivByK(int[] nums, int k) {
        Map<Integer, Integer> prefix = new HashMap<>();
        prefix.put(0, 1);
        int sum = 0;
        int count = 0;
        for (int i = 0; i < nums.length; i++) {
            sum += nums[i];
            sum = sum % k;
            if (sum < 0) {
                sum += k;
            }
            count += prefix.getOrDefault(sum, 0);
            prefix.put(sum, prefix.getOrDefault(sum, 0) + 1);
        }
        return count;
    }
}
```
