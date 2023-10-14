---
author: "volyx"
title:  "1546. Maximum Number of Non-Overlapping Subarrays With Sum Equals Target"
date: "2021-10-16"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "prefix-sum", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1546. Maximum Number of Non-Overlapping Subarrays With Sum Equals Target](maximum-number-of-non-overlapping-subarrays-with-sum-equals-target)

Given an array nums and an integer target.

Return the maximum number of non-empty non-overlapping subarrays such that the sum of values in each subarray is equal to target.

```txt
Example 1:

Input: nums = [1,1,1,1,1], target = 2
Output: 2
Explanation: There are 2 non-overlapping subarrays [1,1,1,1,1] with sum equals to target(2).

Example 2:

Input: nums = [-1,3,5,1,4,2,-9], target = 6
Output: 2
Explanation: There are 3 subarrays with sum equal to 6.
([5,1], [4,2], [3,5,1,4,2,-9]) but only the first 2 are non-overlapping.

Example 3:

Input: nums = [-2,6,6,3,5,4,1,2,8], target = 10
Output: 3

Example 4:

Input: nums = [0,0,0], target = 0
Output: 3
```

Constraints:

- 1 <= nums.length <= 10^5
- -10^4 <= nums[i] <= 10^4
- 0 <= target <= 10^6

## Solution

```java
class Solution {

    public int maxNonOverlapping(int[] nums, int target) {
        Map<Integer, Integer> prefixMap = new HashMap<>();
        int count = 0;
        int sum = 0;
        int lastIndex = -1;
        prefixMap.put(0, -1);
        for (int i = 0; i < nums.length; i++) {
            sum+= nums[i];
            int remain = sum - target;
            if (prefixMap.containsKey(remain)) {
                int start = prefixMap.get(remain);
                if (start >= lastIndex) {
                    count++;
                    lastIndex = i;
                }
            }
            prefixMap.put(sum, i);   
        }
        return count;
    }
}
```
