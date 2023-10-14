---
author: "volyx"
title:  "1021. Remove Outermost Parentheses"
date: "2021-02-20"
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

```txt
Example 1:

Input: "(()())(())"
Output: "()()()"
Explanation: 
The input string is "(()())(())", with primitive decomposition "(()())" + "(())".
After removing outer parentheses of each part, this is "()()" + "()" = "()()()".

Example 2:

Input: "(()())(())(()(()))"
Output: "()()()()(())"
Explanation: 
The input string is "(()())(())(()(()))", with primitive decomposition "(()())" + "(())" + "(()(()))".
After removing outer parentheses of each part, this is "()()" + "()" + "()(())" = "()()()()(())".

Example 3:

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
    /*
    Explanation:

opened count the number of opened parenthesis.
Add every char to the result,
unless the first left parenthesis,
and the last right parenthesis.

"(     ()()   )           (())"
1
    */
     public String removeOuterParentheses(String S) {
        StringBuilder sb = new StringBuilder();
        int opened = 0;
        for (char c : S.toCharArray()) {
            if (c == '(' && opened++ > 0) sb.append(c);
            if (c == ')' && opened-- > 1) sb.append(c);
        }
        return sb.toString();
    }
    public String removeOuterParentheses2(String S) {
        char[] symbols = S.toCharArray();
        int count = 0;
        List<Integer> stack = new ArrayList<>();
        for (int i = 0; i < symbols.length; i++) {
            char c = symbols[i];
            if (c == '(') {
                stack.add(i);
                count++;
            } else {
                Integer removed = null;
                if (!stack.isEmpty() && symbols[stack.get(stack.size() - 1)] == '(') {
                    removed = stack.get(stack.size() - 1);
                    stack.remove(stack.size() - 1);
                } else {
                    stack.add(i);
                }
                count--;
                
                if (count == 0) {
                    symbols[i] = '_';
                    symbols[removed] = '_';
                }
            }
        }
        StringBuilder sb = new StringBuilder();
        
        for (char c : symbols) {
            if (c != '_') {
                sb.append(c);
            }
        }
        return sb.toString();
    }
}
