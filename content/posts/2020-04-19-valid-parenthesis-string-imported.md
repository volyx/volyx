---
author: "volyx"
title:  "Valid Parenthesis String"
date: "2020-04-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

 Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:

- Any left parenthesis '(' must have a corresponding right parenthesis ')'.
- Any right parenthesis ')' must have a corresponding left parenthesis '('.
- Left parenthesis '(' must go before the corresponding right parenthesis ')'.
- '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
- An empty string is also valid.

Example 1:

Input: "()"
Output: True

Example 2:

Input: "(*)"
Output: True

Example 3:

Input: "(*))"
Output: True

Note:
The string size will be in the range [1, 100].

```java
class Solution {
    public boolean checkValidString(String s) {
        Stack<Integer> open = new Stack();
        Stack<Integer> star = new Stack();
        char[] chars = s.toCharArray();
        for (int i = 0 ; i < chars.length; i++) {
            if (chars[i] == '(') {
                open.push(i);            
            } else if (chars[i] == '*') {
                star.push(i);
            } else if (chars[i] == ')'){
                if (!open.isEmpty()) {
                    open.pop();
                } else if (!star.isEmpty()) {
                    star.pop();
                } else {
                    return false;
                }
            }
        }
        while (!open.isEmpty()) {
            if (star.isEmpty()) {
                return false;
            } else if (star.peek() > open.peek()) {
                star.pop();
                open.pop();
            } else {
                return false;
            }
        }
        return true;
    }
}
```
