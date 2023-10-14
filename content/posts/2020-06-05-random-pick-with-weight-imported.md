---
author: "volyx"
title:  "Random Pick with Weight"
date: "2020-06-05"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given an array w of positive integers, where w[i] describes the weight of index i, write a function pickIndex which randomly picks an index in proportion to its weight.

Note:

- 1 <= w.length <= 10000
- 1 <= w[i] <= 10^5
- pickIndex will be called at most 10000 times.

Example 1:
```
Input:
["Solution","pickIndex"]
[[[1]],[]]
Output: [null,0]
```

Example 2:
```
Input:
["Solution","pickIndex","pickIndex","pickIndex","pickIndex","pickIndex"]
[[[1,3]],[],[],[],[],[]]
Output: [null,0,1,1,1,0]
```

Explanation of Input Syntax:

The input is two lists: the subroutines called and their arguments. Solution's constructor has one argument, the array w. pickIndex has no arguments. Arguments are always wrapped with a list, even if there aren't any.

Solution:

```java
class Solution {

    private int[] cum;
    private int sum = 0;
    
    public Solution(int[] w) {
        cum = new int[w.length];
        for (int i = 0; i < w.length; i++) {
            sum += w[i];
            cum[i] = sum;
        }
        System.out.println(Arrays.toString(cum));
    }
    
    public int pickIndex() {
        int idx = (int) (Math.random() * sum) + 1;
        int l = 0;
        int r = cum.length - 1;
        System.out.println(idx);
        while (l < r) {
            int m = l + (r - l) / 2;   
            if (idx > cum[m]) {
                l = m + 1;
            } else {
                r = m;
            }
        }
        return l;
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * Solution obj = new Solution(w);
 * int param_1 = obj.pickIndex();
 */
