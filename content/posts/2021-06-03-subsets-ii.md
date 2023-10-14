---
author: "volyx"
title:  "90. Subsets II"
date: "2021-06-03"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "backtracking"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[90. Subsets II](https://leetcode.com/problems/subsets-ii)

Given an integer array nums that may contain duplicates, return all possible subsets (the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

```txt
Example 1:

Input: nums = [1,2,2]
Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]

Example 2:

Input: nums = [0]
Output: [[],[0]]
```

Constraints:

- 1 <= nums.length <= 10
- -10 <= nums[i] <= 10

## Solution

```java
class Solution {
    public List<List<Integer>> subsetsWithDup(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();
        List<Integer> current = new ArrayList<>();
        Arrays.sort(nums);
        backtrack(nums, 0, current, res);
        return res;
    }
    
    void backtrack(int[] nums, int index, List<Integer> current, 
                   List<List<Integer>> res) {
        res.add(new ArrayList<>(current));
        
        for (int i = index; i < nums.length; i++) {
            if (i > index && nums[i - 1] == nums[i]) {
                continue;
            }
            current.add(nums[i]);
            backtrack(nums, i + 1, current, res);
            current.remove(current.size() - 1);
        }
    }
}
```
