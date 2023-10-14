---
author: "volyx"
title:  "844. Backspace String Compare"
date: "2021-02-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/backspace-string-compare/]

Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

Note that after backspacing an empty text, the text will continue empty.

```txt
Example 1:

Input: S = "ab#c", T = "ad#c"
Output: true
Explanation: Both S and T become "ac".

Example 2:

Input: S = "ab##", T = "c#d#"
Output: true
Explanation: Both S and T become "".

Example 3:

Input: S = "a##c", T = "#a#c"
Output: true
Explanation: Both S and T become "c".

Example 4:

Input: S = "a#c", T = "b"
Output: false
Explanation: S becomes "c" while T becomes "b".
```

Note:

- 1 <= S.length <= 200
- 1 <= T.length <= 200
- S and T only contain lowercase letters and '#' characters.

Follow up:

- Can you solve it in O(N) time and O(1) space?

```java
class Solution {
    
    public boolean backspaceCompare2(String S, String T) {
        int n = Math.max(S.length(), T.length());
        char[] s1 = new char[n];
        char[] s2 = new char[n];
        

        int s1s = cleanString(S, s1);
        int s2s = cleanString(T, s2);
        
        return s1s == s2s && Arrays.equals(s1, s2);
    }
    
    int cleanString(String S, char[] symbols) {
        int size = 0;
        for (char c : S.toCharArray()) {
            if (c == '#') {
              if (size > 0) {
                  symbols[size - 1] = Character.MIN_VALUE;
                  size--;
              }  
                
            } else {
                symbols[size++] = c;
            }
        }
        return size;
    }
}
