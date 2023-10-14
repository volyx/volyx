---
author: "volyx"
title:  "291. Word Pattern II"
date: "2021-11-25"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "backtracking"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![291. Word Pattern II](https://leetcode.com/problems/word-pattern-ii/)

Given a pattern and a string s, return true if s matches the pattern.

A string s matches a pattern if there is some bijective mapping of single characters to strings such that if each character in pattern is replaced by the string it maps to, then the resulting string is s. A bijective mapping means that no two characters map to the same string, and no character maps to two different strings.

```txt
Example 1:

Input: pattern = "abab", s = "redblueredblue"
Output: true
Explanation: One possible mapping is as follows:
'a' -> "red"
'b' -> "blue"

Example 2:

Input: pattern = "aaaa", s = "asdasdasdasd"
Output: true
Explanation: One possible mapping is as follows:
'a' -> "asd"

Example 3:

Input: pattern = "abab", s = "asdasdasdasd"
Output: true
Explanation: One possible mapping is as follows:
'a' -> "a"
'b' -> "sdasd"
Note that 'a' and 'b' cannot both map to "asd" since the mapping is a bijection.

Example 4:

Input: pattern = "aabb", s = "xyzabcxzyabc"
Output: false
```

Constraints:

- 1 <= pattern.length, s.length <= 20
- pattern and s consist of only lower-case English letters.

## Solution

```java
class Solution {
    public boolean wordPatternMatch(String pattern, String s) {
        Map<Character, String> mapping = new HashMap<>();
        Set<String> seen = new HashSet<>();
        
        return isMatch(0, s, 0, pattern, seen, mapping);
    }
    
    boolean isMatch(int si, String s, int pi, String pattern,
                    Set<String> seen,
                    Map<Character, String> mapping) {
        if (si == s.length() && pi == pattern.length()) return true;
        if (si == s.length() || pi == pattern.length()) return false;
        
        char c = pattern.charAt(pi);
        
        String mappingPattern = mapping.get(c);
        
        if (mappingPattern == null) {
            boolean ans = false;
            for (int i = si + 1; i <= s.length(); i++) {
                String newMapping = s.substring(si, i);
                if (seen.add(newMapping)) {
                    mapping.put(c, newMapping);
                    // System.out.println(c + " " + newMapping);
                    ans |= isMatch(i, s, pi + 1, pattern, seen, mapping);
                    if (ans) return true;
                    seen.remove(newMapping);
                    mapping.remove(c);
                }
            }
        } else {
            if (s.startsWith(mappingPattern, si)) {
                return isMatch(si + mappingPattern.length(), s, pi + 1, pattern, seen, mapping);
            }
        }
        return false;
    }
}
```
