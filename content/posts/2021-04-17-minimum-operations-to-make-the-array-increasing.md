---
author: "volyx"
title:  "1827. Minimum Operations to Make the Array Increasing"
date: "2021-04-17"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1827. Minimum Operations to Make the Array Increasing](https://leetcode.com/problems/minimum-operations-to-make-the-array-increasing/)

You are given an integer array nums (0-indexed). In one operation, you can choose an element of the array and increment it by 1.

- For example, if nums = [1,2,3], you can choose to increment nums[1] to make nums = [1,3,3].

Return the minimum number of operations needed to make nums strictly increasing.

An array nums is strictly increasing if nums[i] < nums[i+1] for all 0 <= i < nums.length - 1. An array of length 1 is trivially strictly increasing.

```txt
Example 1:

Input: nums = [1,1,1]
Output: 3
Explanation: You can do the following operations:
1) Increment nums[2], so nums becomes [1,1,2].
2) Increment nums[1], so nums becomes [1,2,2].
3) Increment nums[2], so nums becomes [1,2,3].
```

```txt
Example 2:

Input: nums = [1,5,2,4,1]
Output: 14
```

```txt
Example 3:

Input: nums = [8]
Output: 0
```

Constraints:

- 1 <= nums.length <= 5000
- 1 <= nums[i] <= 104

## Solution

```java
class Solution {
    // nums = [1,5,2,4,1]
    // nums = [1,5,6,4,1]
    public int minOperations(int[] nums) {
        if (nums.length == 1) {
            return 0;
        }
        int count = 0;
        for (int i = 1; i < nums.length; i++) {
            if (nums[i - 1] >= nums[i]) {
                int diff = nums[i - 1] - nums[i]  + 1;
                count = count + diff;
                nums[i] = nums[i] + diff;
            }
        }
        return count;
    }
}
```
