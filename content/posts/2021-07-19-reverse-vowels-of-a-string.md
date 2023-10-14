---
author: "volyx"
title:  "345. Reverse Vowels of a String"
date: "2021-07-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "string", "two-pointers"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1482. Minimum Number of Days to Make m Bouquets](https://leetcode.com/problems/reverse-vowels-of-a-string/)

Given a string s, reverse only all the vowels in the string and return it.

The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both cases.

```txt
Example 1:

Input: s = "hello"
Output: "holle"

Example 2:

Input: s = "leetcode"
Output: "leotcede"
```

Constraints:

- 1 <= s.length <= 3 * 105
- s consist of printable ASCII characters.

## Solution

```java
class Solution {
    public String reverseVowels(String s) {
        Set<Character> vowels = new HashSet<>();
        vowels.addAll(Arrays.asList('a', 'e', 'i', 'o', 'u', 
                                    'A', 'E', 'I', 'O', 'U'));
        
        int lo = 0;
        int hi = s.length() - 1;
        
        char[] word = s.toCharArray();
        
        while (lo < hi) {
            
            while (lo < hi && !vowels.contains(word[lo])) {
                lo++;
            }
            
            while (lo < hi && !vowels.contains(word[hi])) {
                hi--;
            } 
            
            char c = word[lo];
            word[lo] = word[hi];
            word[hi] = c;
            
            lo++;
            hi--;
        }
        
        
        return new String(word);
    }
}
```
