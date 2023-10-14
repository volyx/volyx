---
author: "volyx"
title:  "859. Buddy Strings"
date: "2021-05-08"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[859. Buddy Strings](https://leetcode.com/problems/buddy-strings/)

Given two strings a and b, return true if you can swap two letters in a so the result is equal to b, otherwise, return false.

Swapping letters is defined as taking two indices i and j (0-indexed) such that i != j and swapping the characters at a[i] and a[j].

- For example, swapping at indices 0 and 2 in "abcd" results in "cbad".

```txt
Example 1:

Input: a = "ab", b = "ba"
Output: true
Explanation: You can swap a[0] = 'a' and a[1] = 'b' to get "ba", which is equal to b.
```

```txt
Example 2:

Input: a = "ab", b = "ab"
Output: false
Explanation: The only letters you can swap are a[0] = 'a' and a[1] = 'b', which results in "ba" != b.
```

```txt
Example 3:

Input: a = "aa", b = "aa"
Output: true
Explanation: You can swap a[0] = 'a' and a[1] = 'a' to get "aa", which is equal to b.
```

```txt
Example 4:

Input: a = "aaaaaaabc", b = "aaaaaaacb"
Output: true
```

Constraints:

- 1 <= a.length, b.length <= 2 * 10^4
- a and b consist of lowercase letters.

## Solution

```java
class Solution {
    public boolean buddyStrings(String a, String b) {
        if (a.length() != b.length()) return false;
        int n = a.length();
        int i = -1;
        int j = -1;
        int count = 0;
        int[] freq = new int[256];
        for (int k = 0; k < n; k++) {
            if (a.charAt(k) != b.charAt(k)) {
                count++;
                if (count > 2) {
                    return false;
                }
                if (i == -1) {
                    i = k;
                } else if (j == -1) {
                    j = k;
                }
            }
            freq[a.charAt(k)]++;
        }
        if (count == 0) {
            for (int f: freq) {
                if (f > 1) return true;
            }
        }
        
        if (count != 2) {
            return false;
        }
        return a.charAt(i) == b.charAt(j) 
            && a.charAt(j) == b.charAt(i);
    }
}
```

## Solution 2021-08-21

```java
class Solution {
    public boolean buddyStrings(String s, String goal) {
        int len1 = s.length();
        int len2 = goal.length();
        
        if (len1 != len2) return false;
        
        
        int a = -1;
        int b = -1;
        
        int[] freq1 = new int[26];
        int[] freq2 = new int[26];
        
        for (int i = 0; i < len1; i++) {
            char c1 = s.charAt(i);
            char c2 = goal.charAt(i);
            
            freq1[c1 - 'a']++;
            freq2[c2 - 'a']++;
            
            if (c1 == c2) continue;
            
            if (a == -1) {
                a = i;
                continue;
            }
            
            if (b == -1) {
                b = i;
                continue;
            }
            
            return false;
        }
        
        if (a == -1 && b == -1) {
             for (int count: freq1) {
                 if (count > 1) {
                     return true;
                 }
             }
            return false;
        }
        
        if (a == -1 || b == -1) return false;
        
        return s.charAt(a) == goal.charAt(b) && s.charAt(b) == goal.charAt(a);
    }
}
```
