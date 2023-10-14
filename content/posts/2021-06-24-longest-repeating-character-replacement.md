---
author: "volyx"
title:  "424. Longest Repeating Character Replacement"
date: "2021-06-24"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "sliding-window"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[424. Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement/)

You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.

Return the length of the longest substring containing the same letter you can get after performing the above operations.

```txt
Example 1:

Input: s = "ABAB", k = 2
Output: 4
Explanation: Replace the two 'A's with two 'B's or vice versa.

Example 2:

Input: s = "AABABBA", k = 1
Output: 4
Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
The substring "BBBB" has the longest repeating letters, which is 4.
```

Constraints:

- 1 <= s.length <= 105
- s consists of only uppercase English letters.
- 0 <= k <= s.length
  
## Solution

```java
class Solution {
    public int characterReplacement(String s, int k) {
        int start = 0;
        int end = 0;
        int[] map = new int[128];
        int maxLen = 0;
        int maxChar = 0;
        while (end < s.length()) {
            char c = s.charAt(end);
            map[c]++;
            end++;
            maxChar = Math.max(maxChar, map[c]);
            while (end - start - maxChar > k) {
                char prev = s.charAt(start);
                map[prev]--;
                start++;
            }
            maxLen = Math.max(maxLen, end - start);
        }
        return maxLen;
    }
}
```
