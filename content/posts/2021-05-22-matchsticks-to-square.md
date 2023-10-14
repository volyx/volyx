---
author: "volyx"
title:  "473. Matchsticks to Square"
date: "2021-05-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dfs", "backtracking"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[473. Matchsticks to Square](https://leetcode.com/problems/matchsticks-to-square/)

You are given an integer array matchsticks where matchsticks[i] is the length of the ith matchstick. You want to use all the matchsticks to make one square. You should not break any stick, but you can link them up, and each matchstick must be used exactly one time.

Return true if you can make this square and false otherwise.

```txt
Example 1:

Input: matchsticks = [1,1,2,2,2]
Output: true
Explanation: You can form a square with length 2, one side of the square came two sticks with length 1.
```

![ex1](/images/2021-05-22-ex1.jpg)

```txt
Example 2:

Input: matchsticks = [3,3,3,3,4]
Output: false
Explanation: You cannot find a way to form a square with all the matchsticks.
```

Constraints:

- 1 <= matchsticks.length <= 15
- 0 <= matchsticks[i] <= 109

## Solution

```java
class Solution {
    public boolean makesquare(int[] matchsticks) {
        if (matchsticks.length < 4) return false;
        int sum = 0;
        for (int m: matchsticks) {
            sum+=m;
        }
        Arrays.sort(matchsticks);
        reverse(matchsticks);
        
        if (sum % 4 != 0) return false;
        int[] sums = new int[4];
        return dfs(matchsticks, 0, sums, sum / 4);
    }
    
    boolean dfs(int[] matchsticks, int index, int[] sums, int target) {
        if (index== matchsticks.length) {
            return target == sums[0] 
                && sums[0] == sums[1]
                && sums[1] == sums[2]
                && sums[2] == sums[3];
        } 
        for (int i = 0; i < 4; i++) {
            if (sums[i] + matchsticks[index] > target) continue;
            sums[i] += matchsticks[index];
            if (dfs(matchsticks, index + 1, sums, target)) return true;
            sums[i] -= matchsticks[index];
        }
        return false;
    }
    void reverse(int[] a) {
        for (int i = 0; i < a.length / 2; i++) {
            int j = a.length - i - 1;
            int temp = a[j];
            a[j] = a[i];
            a[i] = temp;    
        }
    }
}
```
