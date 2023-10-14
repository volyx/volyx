---
author: "volyx"
title:  "Climbing Stairs"
date: "2020-06-25"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "dp", "repeat"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![Climbing Stairs](https://leetcode.com/problems/climbing-stairs/)

You are climbing a stair case. It takes n steps to reach to the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

Note: Given n will be a positive integer.

```java
Example 1:

Input: 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps


Example 2:

Input: 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step
```

## Recursive Solution:

```java
class Solution {
    public int climbStairs(int n) {
        return climbStairs(0, n);
    }
    int climbStairs(int i, int n) {
        if (i > n) return 0;
        if (i == n) return 1;
        return climbStairs(i + 1, n) + climbStairs(i + 2, n);
    } 
}
```

## Recursive Solution with Memo

```java
class Solution {
    public int climbStairs(int n) {
        int[] memo = new int[n + 1];
        return climbStairs(0, n, memo);
    }
    int climbStairs(int i, int n, int[] memo) {
        if (i > n) return 0;
        if (i == n) return 1;
        
        if (memo[i] > 0) {
            return memo[i];
        }     
        return memo[i] = climbStairs(i + 1, n, memo) + climbStairs(i + 2, n, memo);
    } 
}
```
