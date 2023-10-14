---
author: "volyx"
title:  "438. Find All Anagrams in a String"
date: "2021-05-11"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "string", "sliding-window"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[438. Find All Anagrams in a String](https://leetcode.com/problems/find-all-anagrams-in-a-string/)

Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.

```txt
Example 1:

Input: s = "cbaebabacd", p = "abc"
Output: [0,6]
Explanation:
The substring with start index = 0 is "cba", which is an anagram of "abc".
The substring with start index = 6 is "bac", which is an anagram of "abc".

Example 2:

Input: s = "abab", p = "ab"
Output: [0,1,2]
Explanation:
The substring with start index = 0 is "ab", which is an anagram of "ab".
The substring with start index = 1 is "ba", which is an anagram of "ab".
The substring with start index = 2 is "ab", which is an anagram of "ab".
```

Constraints:

- 1 <= s.length, p.length <= 3 * 104
- s and p consist of lowercase English letters.

## Solution

```java
class Solution {
    public List<Integer> findAnagrams(String s, String p) {
        int[] freq = new int[26];
        int[] sfreq = new int[26];
        int len = p.length();
        List<Integer> res = new ArrayList<>();
        if (len > s.length()) {
            return res;
        }
        for (int i = 0; i < len; i++) {
            sfreq[s.charAt(i) - 'a']++;
            freq[p.charAt(i) - 'a']++;
        }
        if (Arrays.equals(freq, sfreq)) {
            res.add(0);
        }
        for (int i = len; i < s.length(); i++) {
            sfreq[s.charAt(i) - 'a']++;
            sfreq[s.charAt(i - len) - 'a']--;
            if (Arrays.equals(freq, sfreq)) {
                res.add(i - len + 1);
            }
        }
        return res;
    }
}
```
