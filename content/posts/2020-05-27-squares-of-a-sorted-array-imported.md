---
author: "volyx"
title:  "Squares of a Sorted Array"
date: "2020-05-27"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.

Example 1:

```
Input: [-4,-1,0,3,10]
Output: [0,1,9,16,100]
```

Example 2:

```
Input: [-7,-3,2,3,11]
Output: [4,9,9,49,121]
```

Note:
```
    1 <= A.length <= 10000
    -10000 <= A[i] <= 10000
    A is sorted in non-decreasing order.
```


Solution: 

```java
/** 
 * Forward declaration of guess API.
 * @param  num   your guess
 * @return 	     -1 if num is lower than the guess number
 *			      1 if num is higher than the guess number
 *               otherwise return 0
 * int guess(int num);
 */

public class Solution extends GuessGame {
    public int guessNumber(int n) {
        int l = 0;
        int r = n + 1;
        while (l < r) {
            int mid = l + (r - l) / 2;
            int guess = guess(mid);
            if (guess == 0) {
                return mid;
            }
            if (guess == 1) {
                l = mid;
            } else {
                r = mid + 1;
            }
        }
        return r;
    }
}
