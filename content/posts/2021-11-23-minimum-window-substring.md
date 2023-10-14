---
author: "volyx"
title:  "76. Minimum Window Substring"
date: "2021-11-23"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "two-pointers"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![76. Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)

Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

The testcases will be generated such that the answer is unique.

A substring is a contiguous sequence of characters within the string.

```txt
Example 1:

Input: s = "ADOBECODEBANC", t = "ABC"
Output: "BANC"
Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.

Example 2:

Input: s = "a", t = "a"
Output: "a"
Explanation: The entire string s is the minimum window.

Example 3:

Input: s = "a", t = "aa"
Output: ""
Explanation: Both 'a's from t must be included in the window.
Since the largest window of s only has one 'a', return empty string.
```

Constraints:

- m == s.length
- n == t.length
- 1 <= m, n <= 10^5
- s and t consist of uppercase and lowercase English letters.

## Solution

```java
class Solution {
    public String minWindow(String s, String t) {
        int[] freqT = new int[256];
        int[] freqS = new int[256];
        
        for (int i = 0; i < t.length(); i++) {
            freqT[t.charAt(i)]++;
        }
        
        int lo = 0;
        int hi = 0;
        String res = "";
        int min = Integer.MAX_VALUE;
        
        while (hi < s.length()) {
            
            freqS[s.charAt(hi)]++;
            hi++;
            
            while (moreThanEnough(freqT, freqS)) {
                freqS[s.charAt(lo)]--;
                lo++;
                if (hi - lo < min) {
                    res = s.substring(lo - 1, hi);
                    min = hi - lo;
                }
            }
        }
        
        return res;
    }
    
    boolean moreThanEnough(int[] freqT, int[] freqS) {
        for (int i = 0; i < freqS.length; i++) {
            if (freqT[i] == 0) continue;
            if (freqS[i] < freqT[i]) {
                return false;
            }
        }
        return true;
    }
}
```
