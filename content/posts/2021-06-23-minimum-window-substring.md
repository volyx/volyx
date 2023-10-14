---
author: "volyx"
title:  "76. Minimum Window Substring"
date: "2021-06-23"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "sliding-window"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[76. Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)

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
- 1 <= m, n <= 105
- s and t consist of uppercase and lowercase English letters.

Follow up: Could you find an algorithm that runs in O(m + n) time?

## Solution

```java
class Solution {
    public String minWindow(String s, String t) {
        int[] freq = new int[128];
        int counter = t.length();
        for (char c : t.toCharArray()) {
            freq[c]++;
        }
        
        int start = 0;
        int end = 0;
        int minStart = 0;
        int minLength = Integer.MAX_VALUE;
        
        while (end < s.length()) {
            char c = s.charAt(end);
            
            if (freq[c] > 0) {
                counter--;
            }
            freq[c]--;
            end++;
            while (counter == 0) {
                if (end - start < minLength) {
                    minStart = start;
                    minLength = end - start;
                }
                
                char startChar = s.charAt(start);
                freq[startChar]++;
                
                if (freq[startChar] > 0) {
                    counter++;
                }
                start++;
            }
        }
        
        if (minLength == Integer.MAX_VALUE) {
            return "";
        }

        return s.substring(minStart, minStart + minLength);
    }
}
```
