---
author: "volyx"
title:  "47. Permutations II"
date: "2021-11-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![47. Permutations II](hhttps://leetcode.com/problems/permutations-ii/)

Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.

```txt
Example 1:

Input: nums = [1,1,2]
Output:
[[1,1,2],
 [1,2,1],
 [2,1,1]]

Example 2:

Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
```

Constraints:

- 1 <= nums.length <= 8
- -10 <= nums[i] <= 10

## Solution

```java
class Solution {

    public List<List<Integer>> permuteUnique(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();
        permuteAt(0, nums, res);
        return res;
    }
    
    void permuteAt(int i, int[] nums, List<List<Integer>> res) {
        if (i == nums.length) {
            res.add(toList(nums));
            return;
        }
        Set<Integer> seen = new HashSet<>();
        for (int j = i; j < nums.length; j++) {
            if (seen.add(nums[j])) {
                swap(i, j, nums);
                permuteAt(i + 1, nums, res);
                swap(i, j, nums);   
            }
        }
    }
    
    void swap(int i, int j, int[] arr) {
        int t = arr[i];
        arr[i] = arr[j];
        arr[j] = t;
    }
    
    List<Integer> toList(int[] values) {
        List<Integer> res = new ArrayList<>(values.length);
        for (int val : values) {
            res.add(val);
        }
        return res;
    }
}
```
