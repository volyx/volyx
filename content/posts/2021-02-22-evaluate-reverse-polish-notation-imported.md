---
author: "volyx"
title:  "150. Evaluate Reverse Polish Notation"
date: "2021-02-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/evaluate-reverse-polish-notation/]

Evaluate the value of an arithmetic expression in Reverse Polish Notation.

Valid operators are +, -, *, /. Each operand may be an integer or another expression.

Note:

- Division between two integers should truncate toward zero.
- The given RPN expression is always valid. That means the expression would always evaluate to a result and there won't be any divide by zero operation.

```txt
Example 1:

Input: ["2", "1", "+", "3", "*"]
Output: 9
Explanation: ((2 + 1) * 3) = 9

Example 2:

Input: ["4", "13", "5", "/", "+"]
Output: 6
Explanation: (4 + (13 / 5)) = 6

Example 3:

Input: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
Output: 22
Explanation: 
  ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
= ((10 * (6 / (12 * -11))) + 17) + 5
= ((10 * (6 / -132)) + 17) + 5
= ((10 * 0) + 17) + 5
= (0 + 17) + 5
= 17 + 5
= 22
```


```java
class Solution {
    public int evalRPN(String[] tokens) {
        int[] stack = new int[tokens.length];
        int size = 0;
        
        for (String token: tokens) {
            if (token.equals("+") || token.equals("-") || token.equals("*") || token.equals("/") ) {
                int b = stack[--size];
                int a = stack[--size];
                int c;
                switch (token) {
                    case "+":
                        c = a + b;
                        break;
                    case "-":
                        c = a - b;
                        break;
                    case "*":
                        c = a * b;
                        break;
                    case "/":
                        c = a / b;
                        break;
                    default:
                        throw new RuntimeException();
                }
                stack[size++] = c;
            } else {
                stack[size++] = Integer.valueOf(token);
            }
        }
        return stack[0];
        
    }
}
