---
author: "volyx"
title:  "494. Target Sum"
date: "2021-05-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "backtracking", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[494. Target Sum](https://leetcode.com/problems/target-sum/)

You are given an integer array nums and an integer target.

You want to build an expression out of nums by adding one of the symbols '+' and '-' before each integer in nums and then concatenate all the integers.

- For example, if nums = [2, 1], you can add a '+' before 2 and a '-' before 1 and concatenate them to build the expression "+2-1".

Return the number of different expressions that you can build, which evaluates to target.

```txt
Example 1:

Input: nums = [1,1,1,1,1], target = 3
Output: 5
Explanation: There are 5 ways to assign symbols to make the sum of nums be target 3.
-1 + 1 + 1 + 1 + 1 = 3
+1 - 1 + 1 + 1 + 1 = 3
+1 + 1 - 1 + 1 + 1 = 3
+1 + 1 + 1 - 1 + 1 = 3
+1 + 1 + 1 + 1 - 1 = 3

Example 2:

Input: nums = [1], target = 1
Output: 1
```

Constraints:

- 1 <= nums.length <= 20
- 0 <= nums[i] <= 1000
- 0 <= sum(nums[i]) <= 1000
- -1000 <= target <= 1000

## Solution

```java
class Solution {
    int count = 0;
    public int findTargetSumWays(int[] nums, int target) {
        search(nums, 0, 0, target);
        return count;
    }
    
    void search(int[] nums, int start, int sum, int target) {
        if (target == sum && start == nums.length) {
            count++;
            return;
        }
        
        if (start >= nums.length) return;
        
        search(nums, start + 1, sum + nums[start], target);
        search(nums, start + 1, sum - nums[start], target);
    }
}
```
