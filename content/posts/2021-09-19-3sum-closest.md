---
author: "volyx"
title:  "16. 3Sum Closest"
date: "2021-09-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "twosum","array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![16. 3Sum Closest](https://leetcode.com/problems/3sum-closest)

Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.

Return the sum of the three integers.

You may assume that each input would have exactly one solution.

```txt
Example 1:

Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

Example 2:

Input: nums = [0,0,0], target = 1
Output: 0
```

Constraints:

- 3 <= nums.length <= 1000
- -1000 <= nums[i] <= 1000
- -10^4 <= target <= 10^4

## Solution

```java
class Solution {
    public int threeSumClosest(int[] nums, int target) {
        Arrays.sort(nums);
        int closest = 0;
        int minDistance = Integer.MAX_VALUE;
        int n = nums.length;
        for (int i = 0; i < nums.length - 2; i++) {
            
            int lo = i + 1;
            int hi = n - 1;
            
            while (lo < hi) {
                int sum = nums[i] + nums[lo] + nums[hi];
                if (Math.abs(target - sum) < minDistance) {
                    minDistance = Math.abs(target - sum);
                    closest = sum;
                }
                if (sum > target) {
                    hi--;
                } else {
                    lo++;
                }
                
            }
        }
        return closest;
    }
}
```
