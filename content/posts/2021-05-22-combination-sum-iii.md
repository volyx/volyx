---
author: "volyx"
title:  "216. Combination Sum III"
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

[216. Combination Sum III](https://leetcode.com/problems/combination-sum-iii/)

Find all valid combinations of k numbers that sum up to n such that the following conditions are true:

- Only numbers 1 through 9 are used.
- Each number is used at most once.

Return a list of all possible valid combinations. The list must not contain the same combination twice, and the combinations may be returned in any order.

```txt
Example 1:

Input: k = 3, n = 7
Output: [[1,2,4]]
Explanation:
1 + 2 + 4 = 7
There are no other valid combinations.

Example 2:

Input: k = 3, n = 9
Output: [[1,2,6],[1,3,5],[2,3,4]]
Explanation:
1 + 2 + 6 = 9
1 + 3 + 5 = 9
2 + 3 + 4 = 9
There are no other valid combinations.

Example 3:

Input: k = 4, n = 1
Output: []
Explanation: There are no valid combinations. [1,2,1] is not valid because 1 is used twice.

Example 4:

Input: k = 3, n = 2
Output: []
Explanation: There are no valid combinations.

Example 5:

Input: k = 9, n = 45
Output: [[1,2,3,4,5,6,7,8,9]]
Explanation:
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 = 45
​​​​​​​There are no other valid combinations.
```

Constraints:

- 2 <= k <= 9
- 1 <= n <= 60

## Solution

```java
class Solution {
    List<List<Integer>> res = new ArrayList<>();
    public List<List<Integer>> combinationSum3(int k, int n) {
        List<Integer> current = new ArrayList<>();
        search(k, n, 1, current);
        return res;
    }
    
    void search(int k, int n, int start, List<Integer> current) {
        if (n < 0) return;
        if (current.size() > k) return;
        if (n == 0 && current.size() == k) {
            res.add(new ArrayList<>(current));
            return;
        }
        
        for (int i = start; i < 10; i++) {
            int remainder = n - i;
            if (remainder < 0) continue;
            current.add(i);
            search(k, remainder, i + 1, current);
            current.remove(current.size() - 1);
        }
    }
}
```
