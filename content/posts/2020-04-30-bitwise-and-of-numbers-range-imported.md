---
author: "volyx"
title:  "Bitwise AND of Numbers Range"
date: "2020-04-30"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND of all numbers in this range, inclusive.

Example 1:
```
Input: [5,7]
Output: 4
```

Example 2:
```
Input: [0,1]
Output: 0
```


Solution 1

```java
class Solution {
    public int rangeBitwiseAnd(int m, int n) {
        String left = Integer.toString(m, 2);
        String right = Integer.toString(n, 2);
        if (left.length() != right.length()) {
            return 0;
        }
        int i = 0;
        int counter = 1;
        StringBuilder sb = new StringBuilder();
        while (i < left.length()) {
            if (left.charAt(i) == right.charAt(i)) {
                sb.append(left.charAt(i));
            } else {
                while (i < left.length()) {
                    sb.append('0');
                    i++;
                }
            }
            i++;
        }
        return Integer.parseInt(sb.toString(), 2);
    }
}
```


Solution 2

```java
class Solution {
    public int rangeBitwiseAnd(int m, int n) {

      int answer = 0;
      for (int bit = 30; bit >= 0; bit--) {
          System.out.println("bit " + bit);
          System.out.println(Integer.toString((m & (1 << bit)), 2));
          System.out.println(Integer.toString((n & (1 << bit)), 2));

          if ((m & (1 << bit)) != (n & (1 << bit))) {
              break;
          } else {
              answer |= m & (1 << bit);
          }
      }  
      return answer;        
    }
}
