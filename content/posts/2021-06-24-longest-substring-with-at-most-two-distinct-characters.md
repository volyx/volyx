---
author: "volyx"
title:  "159. Longest Substring with At Most Two Distinct Characters"
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

[159. Longest Substring with At Most Two Distinct Characters](https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/)

Given a string s, return the length of the longest substring that contains at most two distinct characters.

```txt
Example 1:

Input: s = "eceba"
Output: 3
Explanation: The substring is "ece" which its length is 3.

Example 2:

Input: s = "ccaabbb"
Output: 5
Explanation: The substring is "aabbb" which its length is 5.
```

Constraints:

- 1 <= s.length <= 104
- s consists of English letters.

## Solution

```java
class Solution {
    public int lengthOfLongestSubstringTwoDistinct(String s) {
        int start = 0;
        int end = 0;
        int maxLen = 0;
        int uniq = 0;
        int[] map = new int[128];
        
        while (end < s.length()) {
            char c = s.charAt(end);
            map[c]++;
            if (map[c] == 1) uniq++;
            end++;
            while (uniq > 2) {
                char prev = s.charAt(start);
                map[prev]--;
                if (map[prev] == 0) uniq--;
                start++;
            }
            maxLen = Math.max(maxLen, end - start);
        }
        return maxLen;
    }
}
```
