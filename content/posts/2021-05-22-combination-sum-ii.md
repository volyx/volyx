---
author: "volyx"
title:  "40. Combination Sum II"
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

[40. Combination Sum II](https://leetcode.com/problems/combination-sum-ii/)

Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.

Each number in candidates may only be used once in the combination.

Note: The solution set must not contain duplicate combinations.

```txt
Example 1:

Input: candidates = [10,1,2,7,6,1,5], target = 8
Output: 
[
[1,1,6],
[1,2,5],
[1,7],
[2,6]
]

Example 2:

Input: candidates = [2,5,2,1,2], target = 5
Output: 
[
[1,2,2],
[5]
]
```

Constraints:

- 1 <= candidates.length <= 100
- 1 <= candidates[i] <= 50
- 1 <= target <= 30

## Solution

```java
class Solution {
    Set<List<Integer>> res = new HashSet<>(); // !SET
    public List<List<Integer>> combinationSum2(int[] candidates, int target) {
        List<Integer> current = new ArrayList<>();
        Arrays.sort(candidates); // !SET 
        search(candidates, 0, target, current);
        return new ArrayList<>(res);
    }
    
    void search(int[] candidates, int start, int target, List<Integer> current) {
        if (target == 0) {
            res.add(new ArrayList<>(current)); // !SET we only add unique arrays lists, order is preserved because we had sorted candidates previously
            return;
        }
        
        for (int i = start; i < candidates.length; i++) {
            int remainder = target - candidates[i];
            if (remainder < 0) continue;
            current.add(candidates[i]);
            search(candidates, i + 1, remainder, current);
            Integer prev = current.remove(current.size() - 1);
        }
    }
}
```
