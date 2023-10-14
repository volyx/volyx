---
author: "volyx"
title:  "131. Palindrome Partitioning"
date: "2021-06-06"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "backtracking"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[131. Palindrome Partitioning](https://leetcode.com/problems/palindrome-partitioning)

Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.

A palindrome string is a string that reads the same backward as forward.

```txt
Example 1:

Input: s = "aab"
Output: [["a","a","b"],["aa","b"]]

Example 2:

Input: s = "a"
Output: [["a"]]
```

Constraints:

- 1 <= s.length <= 16
- s contains only lowercase English letters.

## Solution

```java
class Solution {
    
    public List<List<String>> partition(String s) {
        List<List<String>> res = new ArrayList<>();
        List<String> current = new ArrayList<>();
        back(0, s.toCharArray(), current, res);
        return res;
    }

    void back(int index, 
              char[] s, List<String> current, 
              List<List<String>> res) {
        
        if (index == s.length) {
            res.add(new ArrayList<>(current));
            return;
        }
        
        for (int i = index + 1; i <= s.length; i++) {
            if (isPalindrom(s, index, i)) {
                current.add(new String(Arrays.copyOfRange(s, index, i)));
                back(i, s, current, res);
                current.remove(current.size() - 1);
            }
        }
    }
    
    boolean isPalindrom(char[] s, int i, int j) {
        if (i == j) return false;
        if (j - i == 1) return true;
        while (i < j) {
            if (s[i++] != s[--j]) {
                return false;
            }
        }
        return true;
    }
}
```
