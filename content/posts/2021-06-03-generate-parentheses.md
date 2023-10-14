---
author: "volyx"
title:  "22. Generate Parentheses"
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

[22. Generate Parentheses](https://leetcode.com/problems/generate-parentheses/)

Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

```txt
Example 1:

Input: n = 3
Output: ["((()))","(()())","(())()","()(())","()()()"]

Example 2:

Input: n = 1
Output: ["()"]
```

Constraints:

- 1 <= n <= 8
  
## Solution

```java
class Solution {
    public List<String> generateParenthesis(int n) {
        List<String> res = new ArrayList<>();
        backtracking("(", 1, 0, n, res);
        return res;
    }
    
    void backtracking(String s, int open, int closed, int n, List<String> res) {
        if (open + closed == 2 * n) {
            res.add(s);
            return;
        }
        if (open < n) 
            backtracking(s + "(", open + 1, closed, n, res);
        
        if (open > closed) 
            backtracking(s + ")", open, closed + 1, n, res);
    }
}
```
