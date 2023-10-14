---
author: "volyx"
title:  "921. Minimum Add to Make Parentheses Valid"
date: "2021-11-23"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "string", "parentheses"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![921. Minimum Add to Make Parentheses Valid](hhttps://leetcode.com/problems/minimum-add-to-make-parentheses-valid/)

A parentheses string is valid if and only if:

- It is the empty string,
- It can be written as AB (A concatenated with B), where A and B are valid strings, or
- It can be written as (A), where A is a valid string.

You are given a parentheses string s. In one move, you can insert a parenthesis at any position of the string.

- For example, if s = "()))", you can insert an opening parenthesis to be "(()))" or a closing parenthesis to be "())))".

Return the minimum number of moves required to make s valid.

```txt
Example 1:

Input: s = "())"
Output: 1

Example 2:

Input: s = "((("
Output: 3

Example 3:

Input: s = "()"
Output: 0

Example 4:

Input: s = "()))(("
Output: 4
```

Constraints:

- 1 <= s.length <= 1000
- s[i] is either '(' or ')'.

## Solution

```java
class Solution {
    public int minAddToMakeValid(String s) {
        int opened = 0;
        int closed = 0;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '(') {
                closed++;
            } else if (s.charAt(i) == ')') {
                if (closed > 0) {
                    closed--;
                } else {
                    opened++;
                }
            }
        }
        return closed + opened;
    }
}
```

## Solution 2022-01-30

```java
class Solution {
    public int minAddToMakeValid(String s) {
        int opened = 0;
        int closed = 0;
        for (char c: s.toCharArray()) {
            if (c == '(') {
                opened++;
            } else if (c == ')') {
                if (opened > 0) {
                    opened--;
                } else {
                    closed++;
                }
            }
        }
        return opened + closed;
    }
}
```
