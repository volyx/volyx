---
author: "volyx"
title:  "990. Satisfiability of Equality Equations"
date: "2021-02-12"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium","union-find"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/satisfiability-of-equality-equations/]

Given an array equations of strings that represent relationships between variables, each string equations[i] has length 4 and takes one of two different forms: "a==b" or "a!=b".  Here, a and b are lowercase letters (not necessarily different) that represent one-letter variable names.

Return true if and only if it is possible to assign integers to variable names so as to satisfy all the given equations.

```txt
Example 1:

Input: ["a==b","b!=a"]
Output: false
Explanation: If we assign say, a = 1 and b = 1, then the first equation is satisfied, but not the second.  There is no way to assign the variables to satisfy both equations.

Example 2:

Input: ["b==a","a==b"]
Output: true
Explanation: We could assign a = 1 and b = 1 to satisfy both equations.

Example 3:

Input: ["a==b","b==c","a==c"]
Output: true

Example 4:

Input: ["a==b","b!=c","c==a"]
Output: false

Example 5:

Input: ["c==c","b==d","x!=z"]
Output: true
```

Note:

- 1 <= equations.length <= 500
- equations[i].length == 4
- equations[i][0] and equations[i][3] are lowercase letters
- equations[i][1] is either '=' or '!'
- equations[i][2] is '='

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
