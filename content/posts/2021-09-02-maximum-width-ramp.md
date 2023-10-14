---
author: "volyx"
title:  "962. Maximum Width Ramp"
date: "2021-09-02"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "monotonic-stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[962. Maximum Width Ramp](https://leetcode.com/problems/maximum-width-ramp/)

A ramp in an integer array nums is a pair (i, j) for which i < j and nums[i] <= nums[j]. The width of such a ramp is j - i.

Given an integer array nums, return the maximum width of a ramp in nums. If there is no ramp in nums, return 0.

```txt
Example 1:

Input: nums = [6,0,8,2,1,5]
Output: 4
Explanation: The maximum width ramp is achieved at (i, j) = (1, 5): nums[1] = 0 and nums[5] = 5.

Example 2:

Input: nums = [9,8,1,0,1,9,4,0,4,1]
Output: 7
Explanation: The maximum width ramp is achieved at (i, j) = (2, 9): nums[2] = 1 and nums[9] = 1.
```

Constraints:

- 2 <= nums.length <= 5 * 10^4
- 0 <= nums[i] <= 5 * 10^4

## Solution

```java
class Solution {
    public int maxWidthRamp(int[] nums) {
        Stack<Integer> stack = new Stack<>();
        for (int i = 0; i < nums.length; i++) {
            if (stack.size() > 0 && nums[i] > nums[stack.peek()] ) {
                continue;
            }
            
            stack.push(i);
        }
        int max = 0;
        for (int i = nums.length - 1; i >= 0; i--) {
            while (stack.size() > 0 && nums[i] >= nums[stack.peek()]) {
                max = Math.max(max, i - stack.pop());
            }
        }
        
        return max;
    }
}
```
