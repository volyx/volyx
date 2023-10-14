---
author: "volyx"
title:  "Minimum Window Substring"
date: "2020-05-31"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

Example:

```
Input: S = "ADOBECODEBANC", T = "ABC"
Output: "BANC"
```

Note:

- If there is no such window in S that covers all characters in T, return the empty string "".
- If there is such window, you are guaranteed that there will always be only one unique minimum window in S.

Solution: 

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

        // Move end to find a valid window.
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
