---
author: "volyx"
title:  "46. Permutations"
date: "2021-05-30"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "backtracking"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[46. Permutations](https://leetcode.com/problems/permutations/)

Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

```txt
Example 1:

Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

Example 2:

Input: nums = [0,1]
Output: [[0,1],[1,0]]

Example 3:

Input: nums = [1]
Output: [[1]]
```

Constraints:

- 1 <= nums.length <= 6
- -10 <= nums[i] <= 10
- All the integers of nums are unique.

## Solution

```java
class Solution {
    public List<List<Integer>> permute(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();
        backtrack(res, nums, 0);
        return res;
    }
    
    void backtrack(List<List<Integer>> res, int[] nums, int index) {
        if (index == nums.length - 1) {
            res.add(toList(nums));
            return;
        }
        
        for (int i = index; i < nums.length; i++) {
            swap(nums, i, index); 
            backtrack(res, nums, index + 1);
            swap(nums, i, index); 
        }
    }
    
    List<Integer> toList(int[] nums) {
        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < nums.length; i++) {
            list.add(nums[i]);
        }
        return list;
    }
    
    void swap(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
}
```

## Solution 2021-11-22

```java
class Solution {
    public List<List<Integer>> permute(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();
        permuteAt(0, nums, res);
        return res;
    }
    
    void permuteAt(int i, int[] nums, List<List<Integer>> res) {
        if (i == nums.length - 1) {
            res.add(toList(nums));
            return;
        }
        
        for (int j = i; j < nums.length; j++) {
            swap(i, j, nums);
            permuteAt(i + 1, nums, res);
            swap(i, j, nums);
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
