---
author: "volyx"
title:  "3. Longest Substring Without Repeating Characters"
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

[3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

Given a string s, find the length of the longest substring without repeating characters.

```txt
Example 1:

Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.

Example 2:

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.

Example 3:

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

Example 4:

Input: s = ""
Output: 0
```

Constraints:

- 0 <= s.length <= 5 * 104
- s consists of English letters, digits, symbols and spaces.

## Solution

```java
class Solution {
    public int lengthOfLongestSubstring(String s) {
        int[] map = new int[128];
        int start = 0;
        int end = 0;
        int maxLen = 0;
        while (end < s.length()) {
            char c = s.charAt(end);
            map[c]++;
            end++;
            while (map[c] > 1) {
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

## Solution 2021-11-16

```java
class Solution {
    /*
     abcabcbb
     01234567
     abc     
      bca
       cab
        abc 
    
    */
    public int lengthOfLongestSubstring(String s) {
        int lo = 0;
        int hi = 0;
        int max = 0;
        Map<Character, Integer> map = new HashMap<>();
        while (hi < s.length()) {
            char c = s.charAt(hi);
            if (map.containsKey(Character.valueOf(c))) {
                lo = Math.max(map.get(Character.valueOf(c)), lo);
            }
            max = Math.max(max, hi - lo + 1);
            map.put(s.charAt(hi), hi + 1);
            hi++;
        }
        return max;
    }
    
    
    public int lengthOfLongestSubstring2(String s) {
        int lo = 0;
        int hi = 0;
        int max = 0;
        int[] freq = new int[256];
        while (hi < s.length()) {
            char c = s.charAt(hi);
            freq[c]++;
            while (freq[c] > 1) {
                char prev = s.charAt(lo);
                freq[prev]--;
                lo++;
            }
            max = Math.max(max, hi - lo + 1);
            hi++;
        }
        return max;
    }
}
```
