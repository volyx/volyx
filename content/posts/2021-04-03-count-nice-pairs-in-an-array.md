---
author: "volyx"
title:  "1814. Count Nice Pairs in an Array"
date: "2021-04-03"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "tree", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1814. Count Nice Pairs in an Array](https://leetcode.com/problems/count-nice-pairs-in-an-array/)

You are given an array nums that consists of non-negative integers. Let us define rev(x) as the reverse of the non-negative integer x. For example, rev(123) = 321, and rev(120) = 21. A pair of indices (i, j) is nice if it satisfies all of the following conditions:

- 0 <= i < j < nums.length
- nums[i] + rev(nums[j]) == nums[j] + rev(nums[i])

Return the number of nice pairs of indices. Since that number can be too large, return it modulo 109 + 7.

```txt
Example 1:

Input: nums = [42,11,1,97]
Output: 2
Explanation: The two pairs are:
 - (0,3) : 42 + rev(97) = 42 + 79 = 121, 97 + rev(42) = 97 + 24 = 121.
 - (1,2) : 11 + rev(1) = 11 + 1 = 12, 1 + rev(11) = 1 + 11 = 12.
```

```txt
Example 2:

Input: nums = [13,10,35,24,76]
Output: 4
```

Constraints:

- 1 <= nums.length <= 105
- 0 <= nums[i] <= 109

## Solution

```java
class Solution {
    int MODULO = 1_000_000_007;
    public int countNicePairs(int[] nums) {
        Map<Integer, Integer> diffsMap = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            int rev = rev(nums[i]);
            int diff = nums[i] - rev;
            diffsMap.put(diff, diffsMap.getOrDefault(diff, 0) + 1);
        }
        long count = 0;
        for (var e: diffsMap.entrySet()) {
            long v = e.getValue();
            if (v > 1) {
                v = (v * (v - 1)) / 2;
                count = (count + v) % MODULO;
            }
        }
        return (int) count;
    }
    
    int rev(int x) {
        int n = 0;
        while (x > 0) {
            int t = x % 10;
            n = n * 10 + t;
            x = x / 10;
        }
        return n;
    }
}
```
