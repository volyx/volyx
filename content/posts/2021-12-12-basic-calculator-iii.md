---
author: "volyx"
title:  "772. Basic Calculator III"
date: "2021-12-12"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "recursive", "string", "math"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![772. Basic Calculator III](https://leetcode.com/problems/basic-calculator-iii/)

Implement a basic calculator to evaluate a simple expression string.

The expression string contains only non-negative integers, '+', '-', '*', '/' operators, and open '(' and closing parentheses ')'. The integer division should truncate toward zero.

You may assume that the given expression is always valid. All intermediate results will be in the range of [-231, 231 - 1].

Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

```txt
Example 1:

Input: s = "1+1"
Output: 2

Example 2:

Input: s = "6-4/2"
Output: 4

Example 3:

Input: s = "2*(5+5*2)/3+(6/2+8)"
Output: 21

Example 4:

Input: s = "(2+6*3+5-(3*14/7+2)*5)+3"
Output: -12

Example 5:

Input: s = "0"
Output: 0
```

Constraints:

- 1 <= s <= 104
- s consists of digits, '+', '-', '*', '/', '(', and ')'.
- s is a valid expression.

## Solution

```java
class Solution {
    public int calculate(String s) {
        int l1 = 0;
        int o1 = 1; // 1 ? + : -
        int l2 = 1;
        int o2 = 1; // 1 ? * : /
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (Character.isDigit(c)) {
                int num = c - '0';
                while (i + 1 < s.length() && Character.isDigit(s.charAt(i + 1))) {
                    i++;
                    num = 10 * num + (s.charAt(i) - '0');
                }
                l2 = (o2 == 1) ? l2 * num : l2 / num;
            } else if (c == '(') {
                int count = 0;
                int j = i;
                while (i < s.length()) {
                    if (s.charAt(i) == '(') count++;
                    if (s.charAt(i) == ')') count--;
                    if (count == 0) break;
                    i++;
                }
                int num = calculate(s.substring(j + 1, i));
                l2 = (o2 == 1) ? l2 * num : l2 / num;
            } else if (c == '*' || c == '/') {
                o2 = (c == '*') ? 1 : -1;
            } else if (c == '+' || c == '-') {
                l1 = l1 + l2 * o1;
                o1 = (c == '+') ? 1 : -1;
                l2 = 1;
                o2 = 1;
            }
            // System.out.println(String.format("%s l1=%d o1=%d l2=%d o2=%d", c, l1, o1, l2, o2));
        }
        return l1 + (l2 * o1);
    }
}
```
