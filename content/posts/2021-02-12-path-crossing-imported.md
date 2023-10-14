---
author: "volyx"
title:  "1496. Path Crossing"
date: "2021-02-12"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/path-crossing/]

Given a string path, where path[i] = 'N', 'S', 'E' or 'W', each representing moving one unit north, south, east, or west, respectively. You start at the origin (0, 0) on a 2D plane and walk on the path specified by path.

Return True if the path crosses itself at any point, that is, if at any time you are on a location you've previously visited. Return False otherwise.

![ex1](/images/2021-02-12-ex1.jpg)

```txt
Example 1:

Input: path = "NES"
Output: false 
Explanation: Notice that the path doesn't cross any point more than once.
```

![ex2](/images/2021-02-12-ex2.jpg)

```txt
Example 2:

Input: path = "NESWW"
Output: true
Explanation: Notice that the path visits the origin twice.
```

Constraints:

- 1 <= path.length <= 10^4
- path will only consist of characters in {'N', 'S', 'E', 'W}

```java
class Solution {
    int[] parents = new int[26];
    
    public boolean equationsPossible(String[] equations) {
        
        for (int i = 0; i < 26; i++) {
            parents[i] = i;
        }
        
        for (String equation: equations) {
            int c1 = equation.charAt(0) - 'a';
            int c2 = equation.charAt(equation.length() - 1) - 'a';
            if (equation.contains("==")) {
                union(c1, c2);
            } 
        }
 
        for (String equation: equations) {
            int c1 = equation.charAt(0) - 'a';
            int c2 = equation.charAt(equation.length() - 1) - 'a';
            if (equation.contains("!=")
               && find(c1) == find(c2)) {
               return false;
            } 
        }
        return true;
    }
    
    void union(int p, int q) {
        if (p == q) {
            return;
        }
        int pid = find(p);
        int qid = find(q);
        parents[qid] = pid;
    }
    
     int find(int p) {
         while (p != parents[p]) {
             p = parents[p];
         }
         return p;
     }
}
