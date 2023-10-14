---
author: "volyx"
title:  "39. Combination Sum"
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

[39. Combination Sum](https://leetcode.com/problems/combination-sum/)

Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

```txt
Example 1:

Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3],[7]]
Explanation:
2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
7 is a candidate, and 7 = 7.
These are the only two combinations.

Example 2:

Input: candidates = [2,3,5], target = 8
Output: [[2,2,2,2],[2,3,3],[3,5]]

Example 3:

Input: candidates = [2], target = 1
Output: []

Example 4:

Input: candidates = [1], target = 1
Output: [[1]]

Example 5:

Input: candidates = [1], target = 2
Output: [[1,1]]
```

Constraints:

- 1 <= candidates.length <= 30
- 1 <= candidates[i] <= 200
- All elements of candidates are distinct.
- 1 <= target <= 500

## Solution

```java
class Solution {
    List<List<Integer>> res = new ArrayList<>();
    public List<List<Integer>> combinationSum(int[] candidates, int target) { 
       List<Integer> current = new ArrayList<>(); 
       search(candidates, target, current);
       return res; 
    }
    
    void search(int[] candidates, int target, List<Integer> current) {
        if (target == 0) {
            res.add(new ArrayList<>(current));
            return;
        }
        for (int candidate : candidates) {
            int remained = target - candidate;
            if (remained < 0) continue;
            if (current.size() > 0 && current.get(current.size() - 1) > candidate) continue;
            current.add(candidate);
            search(candidates, remained, current);
            Integer prev = current.remove(current.size() - 1);
        }
    }
}
```

## Solution 04.06.2021

```java
class Solution {
    public List<List<Integer>> combinationSum(int[] candidates, int target) {
        List<List<Integer>> res = new ArrayList<>();
        
        List<Integer> current = new ArrayList<>();
        
        back(candidates, 0, target, current, res);
        
        return res;
    }
    
    void back(int[] candidates, 
              int index,
              int target,
              List<Integer> current,
              List<List<Integer>> res
             ) {
        if (target == 0) {
            res.add(new ArrayList<>(current));
            return;
        }
        
        for (int i = index; i < candidates.length; i++) {
            int candidate = candidates[i];
            int remainder = target - candidate;
            if (remainder < 0) continue;
            if (current.size() > 0 
                && candidate < current.get(current.size() - 1)) {
                continue;
            }
            current.add(candidate);
            back(candidates, index, remainder, current, res);
            current.remove(current.size() - 1);
        }
    }
}
```

## Solution 2021-10-20

```java
class Solution {
    public List<List<Integer>> combinationSum(int[] candidates, int target) {
        List<List<Integer>> res = new ArrayList<>();
        List<Integer> curr = new ArrayList<>();
        Arrays.sort(candidates);
        back(0, target, candidates, curr, res);
        return res;    
    }
    
    void back(int pos, int target, int[] candidates,
              List<Integer> curr, List<List<Integer>> res) {
        
        if (target < 0) return;
        if (pos == candidates.length) {
            if (target == 0) {
                res.add(List.copyOf(curr));
            }
            return;
        }
        if (curr.size() > 1 && (curr.get(curr.size() - 2) > curr.get(curr.size() - 1))) {
            return;
        }
        curr.add(candidates[pos]);
        // add same
        back(pos, target - candidates[pos], candidates, curr, res);
        Integer prev = curr.remove(curr.size() - 1);
         // skip next
        back(pos + 1, target, candidates, curr, res);
        
        
    }
}
```
