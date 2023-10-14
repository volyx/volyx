---
author: "volyx"
title:  "1021. Remove Outermost Parentheses"
date: "2021-01-26"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/remove-outermost-parentheses/]

A valid parentheses string is either empty (""), "(" + A + ")", or A + B, where A and B are valid parentheses strings, and + represents string concatenation.  For example, "", "()", "(())()", and "(()(()))" are all valid parentheses strings.

A valid parentheses string S is primitive if it is nonempty, and there does not exist a way to split it into S = A+B, with A and B nonempty valid parentheses strings.

Given a valid parentheses string S, consider its primitive decomposition: S = P_1 + P_2 + ... + P_k, where P_i are primitive valid parentheses strings.

Return S after removing the outermost parentheses of every primitive string in the primitive decomposition of S.

Example 1:

```txt
Input: "(()())(())"
Output: "()()()"
Explanation: 
The input string is "(()())(())", with primitive decomposition "(()())" + "(())".
After removing outer parentheses of each part, this is "()()" + "()" = "()()()".
```

Example 2:

```txt
Input: "(()())(())(()(()))"
Output: "()()()()(())"
Explanation: 
The input string is "(()())(())(()(()))", with primitive decomposition "(()())" + "(())" + "(()(()))".
After removing outer parentheses of each part, this is "()()" + "()" + "()(())" = "()()()()(())".
```

Example 3:

```txt
Input: "()()"
Output: ""
Explanation: 
The input string is "()()", with primitive decomposition "()" + "()".
After removing outer parentheses of each part, this is "" + "" = "".
```

Note:

- S.length <= 10000
- S[i] is "(" or ")"
- S is a valid parentheses string

```java
class Solution {
    public String removeOuterParentheses(String S) {
        StringBuilder sb = new StringBuilder();
        int opened = 0;
        for (char c : S.toCharArray()) {
            if (c == '(') {
                // skip first opened
                if (opened != 0) {
                    sb.append(c);
                }
                opened++;
            } else {
                opened--;
                // skip last closed
                if (opened != 0) {
                     sb.append(c);
                }
            }
        }
        return sb.toString();
    }
}
