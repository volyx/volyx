---
author: "volyx"
title:  "Valid perfect sqaure"
date: "2020-05-29"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a positive integer num, write a function which returns True if num is a perfect square else False.

Follow up: Do not use any built-in library function such as sqrt

Example 1:
```
Input: num = 16
Output: true
```

Example 2:
```
Input: num = 14
Output: false
```

Solution: 

```java
class Solution {
   public boolean isPerfectSquare(int num) { 
       return isPerfectSquareSearch(num);
    }
    public boolean isPerfectSquareNewTon(int num) {
        if (num < 2) return true;
        int root = num;
        while (root - num / root > 0) {
            root = (root + num/root) / 2;
            System.out.printf("%d\n", root);
        }
        return root * root  == num;
    }
   public boolean isPerfectSquareSearch(int num) {
        if (num < 2) return true;
        long left = 2, right = num / 2, x;
        while (left <= right) {
            x = left + (right - left) / 2;
            if (x * x == num) return true;
            if (x * x > num) {
                right = x - 1;
            } else {
                left = x + 1;
            }
            System.out.printf("%d\n", x);
        }
        return false;
    }
    float abs(int num) {
        if (num < 0)
            return -num;
        else 
            return num;
    }
}
