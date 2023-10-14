---
author: "volyx"
title:  "921. Minimum Add to Make Parentheses Valid"
date: "2021-02-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/]

Given a string s of '(' , ')' and lowercase English characters. 

Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.

Formally, a parentheses string is valid if and only if:

- It is the empty string, contains only lowercase characters, or
- It can be written as AB (A concatenated with B), where A and B are valid strings, or
- It can be written as (A), where A is a valid string.

```txt
Example 1:

Input: s = "lee(t(c)o)de)"
Output: "lee(t(c)o)de"
Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.

Example 2:

Input: s = "a)b(c)d"
Output: "ab(c)d"

Example 3:

Input: s = "))(("
Output: ""
Explanation: An empty string is also valid.

Example 4:

Input: s = "(a(b(c)d)"
Output: "a(b(c)d)"
```

Constraints:

- 1 <= s.length <= 10^5
- s[i] is one of  '(' , ')' and lowercase English letters.

```java
class Solution {
    public String minRemoveToMakeValid(String s) {
        char[] symbols = s.toCharArray();
        int count = 0;
        for (int i = 0; i < symbols.length; i++) {
            char c = symbols[i];
            if (c == '(') {
                count++;
            } else if (c == ')') {
                if (count > 0) {
                    count--;
                } else {
                    symbols[i] = '_';
                }
            }
        }
        
        count = 0;
        for (int i = symbols.length - 1; i >= 0; i--) {
            char c = symbols[i];
            if (c == ')') {
                count++;
            } else if (c == '(') {
                if (count > 0) {
                    count--;
                } else {
                    symbols[i] = '_';
                }
            }
        }
        
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < symbols.length; i++) {
            if (symbols[i] != '_') {
                sb.append(symbols[i]);
            }
        }
        return sb.toString();
    }
}
```

## Solution 2021-11-22

```java
class Solution {
    public String minRemoveToMakeValid(String s) {
        char[] symbols = s.toCharArray();
        int count = 0;
        for (int i = 0; i < symbols.length; i++) {
            if (symbols[i] == '(') {
                count++;
            } else if (symbols[i] == ')') {
                if (count > 0) {
                    count--;
                } else {
                    symbols[i] = '_';
                }
            }
        }
        count = 0;
        for (int i = symbols.length - 1; i >= 0; i--) {
            if (symbols[i] == ')') {
                count++;
            } else if (symbols[i] == '(') {
                if (count > 0) {
                    count--;
                } else {
                    symbols[i] = '_';
                }
            }
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < symbols.length; i++) {
            if (symbols[i] != '_') {
                sb.append(symbols[i]);
            }
        }
        return sb.toString();
    }
}
```

## Solution 2022-01-22

```java
class Solution {
    public String minRemoveToMakeValid(String s) {
        int open = 0;
        int close = 0;
        char[] symbols = s.toCharArray();
        for (int i = 0; i < symbols.length; i++) {
            char c = symbols[i];
            if (c == '(') {
                open++;
            } else if (c == ')') {
                if (open > 0) {
                   open--;
                } else {
                    symbols[i] = '_';
                }
            }
            int j = s.length() - i - 1;
            char e = symbols[j];
            if (e == '(') {
                if (close > 0) {
                   close--;
                } else {
                    symbols[j] = '_';
                }
            } else if (e == ')') {
                close++;
            }    
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < symbols.length; i++) {
            if (symbols[i] != '_') {
                sb.append(symbols[i]);
            }
        }
        return sb.toString();
    }
}
```
