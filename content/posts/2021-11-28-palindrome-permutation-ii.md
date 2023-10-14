---
author: "volyx"
title:  "267. Palindrome Permutation II"
date: "2021-11-28"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![267. Palindrome Permutation II](https://leetcode.com/problems/palindrome-permutation-ii/)

Given a string s, return all the palindromic permutations (without duplicates) of it.

You may return the answer in any order. If s has no palindromic permutation, return an empty list.

```txt
Example 1:

Input: s = "aabb"
Output: ["abba","baab"]

Example 2:

Input: s = "abc"
Output: []
```

Constraints:

- 1 <= s.length <= 16
- s consists of only lowercase English letters.

## Solution

```java
class Solution {
    public List<String> generatePalindromes(String s) {
        Set<String> res = new HashSet<>();
        int[] freq = new int[256];
        int count = 0;
        for (char c : s.toCharArray()) {
            freq[c]++;
        }
        
        if (!canPermute(freq)) {
            return Collections.emptyList();
        }
        
        char mid = ' ';
        int k = 0;
        char[] st = new char[s.length() / 2];
        for (int i = 0; i < freq.length; i++) {
            if (freq[i] % 2 == 1) {
                mid = (char) i;
            }
            for (int j = 0; j < freq[i] / 2; j++) {
                st[k++] = (char) i;
            }
        }
        
        permute(0, st, mid, res);
        
        return new ArrayList<>(res);
    }
    
    void permute(int i, char[] st, char mid, Set<String> res) {
        if (i == st.length) {
            String m = ((mid == ' ') ? "": "" + mid);
            String val = new String(st) + m + new StringBuilder(new String(st)).reverse().toString();
            res.add(val);
        } else {
            for (int j = i; j < st.length; j++) {
                swap(i, j, st);
                permute(i + 1, st, mid, res);
                swap(i, j, st);
            }
        }
    }
    
    boolean canPermute(int[] freq) {
        int count = 0;
        for (int f: freq) {
            count += f % 2;
        }
        
        return count <= 1;
    }
    
    void swap(int i, int j, char[] st) {
        char t = st[i];
        st[i] = st[j];
        st[j] = t;
    }
}
```
