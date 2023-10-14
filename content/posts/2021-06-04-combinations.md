---
author: "volyx"
title:  "77. Combinations"
date: "2021-06-04"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "backtracking"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[77. Combinations](https://leetcode.com/problems/combinations)

Given two integers n and k, return all possible combinations of k numbers out of the range [1, n].

You may return the answer in any order.

```txt
Example 1:

Input: n = 4, k = 2
Output:
[
  [2,4],
  [3,4],
  [2,3],
  [1,2],
  [1,3],
  [1,4],
]

Example 2:

Input: n = 1, k = 1
Output: [[1]]
```

Constraints:

- 1 <= n <= 20
- 1 <= k <= n

## Solution

```java
class Solution {
    public List<List<Integer>> combine(int n, int k) {
        List<List<Integer>> res = new ArrayList<>();
        List<Integer> current = new ArrayList<>();
        back(1, n, k, current, res);
        return res;
    }
    void back(int value, int n, int k,
              List<Integer> current, 
              List<List<Integer>> res) {
        if (current.size() == k) {
            res.add(new ArrayList<>(current));
            return;
        }
        for (int i = value; i <= n; i++) {
            current.add(i);
            back(i + 1, n, k, current, res);
            current.remove(current.size() - 1);
        }
    }
}
```
