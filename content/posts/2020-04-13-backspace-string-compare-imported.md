---
author: "volyx"
title:  "Backspace String Compare"
date: "2020-04-13"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

```txt
Example 1:

Input: S = "ab#c", T = "ad#c"
Output: true
Explanation: Both S and T become "ac".
```

```txt
Example 2:

Input: S = "ab##", T = "c#d#"
Output: true
Explanation: Both S and T become "".
```

```txt
Example 3:

Input: S = "a##c", T = "#a#c"
Output: true
Explanation: Both S and T become "c".
```

```txt
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
    public boolean backspaceCompare(String S, String T) {
        StringBuilder s1 = new StringBuilder();
        StringBuilder t1 = new StringBuilder();
        int i = 0;
        int j = 0;
        char[] s = S.toCharArray();
        char[] t = T.toCharArray();
        while(i < s.length || j < t.length) {
            if (i < s.length) {
                if (s[i] == '#') {
                    if (s1.length() != 0) {
                        s1.deleteCharAt(s1.length() - 1);
                    } 
                } else {
                     s1.append(s[i]);
                }
                i++;
            }
            
            if (j < t.length) {
                if (t[j] == '#') {
                    if (t1.length() != 0) {
                        t1.deleteCharAt(t1.length() - 1);
                    } 
                } else {
                     t1.append(t[j]);
                }
                j++;
            }
        }
        System.out.printf("%s %s\n", s1, t1);
        return s1.toString().equals(t1.toString());
    }
}
```
