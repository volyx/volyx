---
author: "volyx"
title:  "161. One Edit Distance"
date: "2021-11-21"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![161. One Edit Distance](https://leetcode.com/problems/one-edit-distance/)

Given two strings s and t, return true if they are both one edit distance apart, otherwise return false.

A string s is said to be one distance apart from a string t if you can:

- Insert exactly one character into s to get t.
- Delete exactly one character from s to get t.
- Replace exactly one character of s with a different character to get t.

```txt
Example 1:

Input: s = "ab", t = "acb"
Output: true
Explanation: We can insert 'c' into s to get t.
```

```txt
Example 2:

Input: s = "", t = ""
Output: false
Explanation: We cannot get t from s by only one step.
```

```txt
Example 3:

Input: s = "a", t = ""
Output: true
```

```txt
Example 4:

Input: s = "", t = "A"
Output: true
```

Constraints:

- 0 <= s.length <= 10^4
- 0 <= t.length <= 10^4
- s and t consist of lower-case letters, upper-case letters and/or digits.

## Solution DFS

```java
class Solution {
    
    public boolean isOneEditDistance(String s, String t) {
        return dfs(0, 0, s, t, 1);
    }
    
    boolean dfs(int i1, int i2, String s, String t, int editCount) {
        if (i1 == s.length() && i2 == t.length()) {
            return editCount == 0;
        } else if (i1 == s.length() || i2 == t.length()) {
            return editCount == 1 && Math.abs(s.length() - t.length()) == 1;
        }
        
        if (s.charAt(i1) == t.charAt(i2)) {
            return dfs(i1 + 1, i2 + 1, s, t, editCount);
        } else {
            if (editCount == 0) {
                return false;
            }
            return dfs(i1, i2 + 1, s, t, 0) || dfs(i1 + 1, i2, s, t, 0) || dfs(i1 + 1, i2 + 1, s, t, 0);
        }
    }
}
```

## Solution Linear

```java
class Solution {
    public boolean isOneEditDistance(String s, String t) {
        if (s.length() > t.length()) {
            return isOneEditDistance(t, s);
        }
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) != t.charAt(i)) {
                return s.substring(i + 1).equals(t.substring(i + 1)) ||
                    s.substring(i).equals(t.substring(i + 1));
            }
        }
        return Math.abs(s.length() - t.length()) == 1;
    }
}
```
