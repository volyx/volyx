---
author: "volyx"
title:  "259. 3Sum Smaller"
date: "2021-09-09"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "segment-tree", "tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[259. 3Sum Smaller](https://leetcode.com/problems/3sum-smaller/)

Given an array of n integers nums and an integer target, find the number of index triplets i, j, k with 0 <= i < j < k < n that satisfy the condition nums[i] + nums[j] + nums[k] < target.

```txt
Example 1:

Input: nums = [-2,0,1,3], target = 2
Output: 2
Explanation: Because there are two triplets which sums are less than 2:
[-2,0,1]
[-2,0,3]

Example 2:

Input: nums = [], target = 0
Output: 0

Example 3:

Input: nums = [0], target = 0
Output: 0
```

Constraints:

- n == nums.length
- 0 <= n <= 3500
- -100 <= nums[i] <= 100
- -100 <= target <= 100

## Solution

```java
class Solution {

    public int threeSumSmaller(int[] nums, int target) {
        Arrays.sort(nums);
        int n = nums.length;
        int count = 0;
        for (int i = 0; i < n - 2; i++) {
            int lo = i + 1;
            int hi = n - 1;
            while (lo < hi) {
                int sum = nums[i] + nums[lo] + nums[hi];
                if (sum < target) {
                    count += hi - lo;
                    lo++;
                } else {
                  hi--;
                }
            }
        }
        return count;
    }
}
```
