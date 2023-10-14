---
author: "volyx"
title:  "First Bad Version"
date: "2020-05-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.

The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".

Example 1:
```
Input: J = "aA", S = "aAAbbbb"
Output: 3
```

Example 2:
```
Input: J = "z", S = "ZZ"
Output: 0
```

Note:
```
    S and J will consist of letters and have length at most 50.
    The characters in J are distinct.
```


 
Solution: 

```java
class Solution {
    public int numJewelsInStones(String J, String S) {
        final Set<Character> jewels = new HashSet<>();
        for (int i = 0; i < J.length(); i++) {
            jewels.add(Character.valueOf(J.charAt(i)));
        }
        int count = 0;
        for (int i = 0; i < S.length(); i++) {
            if (jewels.contains(Character.valueOf(S.charAt(i)))) {
                count++;
            }
        }
        return count;
    }
}
