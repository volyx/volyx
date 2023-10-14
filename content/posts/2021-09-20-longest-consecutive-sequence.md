---
author: "volyx"
title:  "128. Longest Consecutive Sequence"
date: "2021-09-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![128. Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/)

Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

You must write an algorithm that runs in O(n) time.

```txt
Example 1:

Input: nums = [100,4,200,1,3,2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
```

```txt
Example 2:

Input: nums = [0,3,7,2,5,8,4,6,0,1]
Output: 9
```

Constraints:

- 0 <= nums.length <= 105
- -10^9 <= nums[i] <= 10^9

## DFS Solution

```java
class Solution {
    public int longestConsecutive(int[] nums) {
        int n = nums.length;
        if (n == 0) return 0;
        Arrays.sort(nums);
        int max = 1;
        int currentMax = 1;
        for (int i = 1; i < n ; i++) {
            if (nums[i] - nums[i - 1] == 0) {
                continue;
            } else if (nums[i] - nums[i - 1] == 1) {
                currentMax++;
                max = Math.max(max, currentMax);
            } else {
                currentMax = 1;
            }   
        }
        return max;
    }
}
```
