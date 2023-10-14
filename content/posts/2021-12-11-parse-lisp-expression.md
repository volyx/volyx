---
author: "volyx"
title:  "736. Parse Lisp Expression"
date: "2021-12-11"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "recursive", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![736. Parse Lisp Expression](https://leetcode.com/problems/parse-lisp-expression/)

You are given a string expression representing a Lisp-like expression to return the integer value of.

The syntax for these expressions is given as follows.

-An expression is either an integer, let expression, add expression, mult expression, or an assigned variable. Expressions always evaluate to a single integer.
- (An integer could be positive or negative.)
- A let expression takes the form "(let v1 e1 v2 e2 ... vn en expr)", where let is always the string "let", then there are one or more pairs of alternating variables and expressions, meaning that the first variable v1 is assigned the value of the expression e1, the second variable v2 is assigned the value of the expression e2, and so on sequentially; and then the value of this let expression is the value of the expression expr.
- An add expression takes the form "(add e1 e2)" where add is always the string "add", there are always two expressions e1, e2 and the result is the addition of the evaluation of e1 and the evaluation of e2.
- A mult expression takes the form "(mult e1 e2)" where mult is always the string "mult", there are always two expressions e1, e2 and the result is the multiplication of the evaluation of e1 and the evaluation of e2.
- For this question, we will use a smaller subset of variable names. A variable starts with a lowercase letter, then zero or more lowercase letters or digits. Additionally, for your convenience, the names "add", "let", and "mult" are protected and will never be used as variable names.
- Finally, there is the concept of scope. When an expression of a variable name is evaluated, within the context of that evaluation, the innermost scope (in terms of parentheses) is checked first for the value of that variable, and then outer scopes are checked sequentially. It is guaranteed that every expression is legal. Please see the examples for more details on the scope.

```txt
Example 1:

Input: expression = "(let x 2 (mult x (let x 3 y 4 (add x y))))"
Output: 14
Explanation: In the expression (add x y), when checking for the value of the variable x,
we check from the innermost scope to the outermost in the context of the variable we are trying to evaluate.
Since x = 3 is found first, the value of x is 3.

Example 2:

Input: expression = "(let x 3 x 2 x)"
Output: 2
Explanation: Assignment in let statements is processed sequentially.

Example 3:

Input: expression = "(let x 1 y 2 x (add x y) (add x y))"
Output: 5
Explanation: The first (add x y) evaluates as 3, and is assigned to x.
The second (add x y) evaluates as 3+2 = 5.

Example 4:

Input: expression = "(let x 2 (add (let x 3 (let x 4 x)) x))"
Output: 6
Explanation: Even though (let x 4 x) has a deeper scope, it is outside the context
of the final x in the add-expression.  That final x will equal 2.

Example 5:

Input: expression = "(let a1 3 b2 (add a1 1) b2)"
Output: 4
Explanation: Variable names can contain digits after the first character.
```

Constraints:

- 1 <= expression.length <= 2000
- There are no leading or trailing spaces in exprssion.
- All tokens are separated by a single space in expressoin.
- The answer and all intermediate calculations of that answer are guaranteed to fit in a 32-bit integer.
- The expression is guaranteed to be legal and evaluate to an integer.

## Solution

```java
class Solution {
    public int evaluate(String expression) {
        return eval(expression, new HashMap<>());
    }
    
    int eval(String exp, Map<String, Integer> parent) {
        if (exp.charAt(0) != '(') {
            // number or symbol
            if (Character.isDigit(exp.charAt(0)) || exp.charAt(0) == '-') {
                return Integer.parseInt(exp);
            }
            return parent.get(exp);
        }
        
        Map<String, Integer> map = new HashMap<>();
        map.putAll(parent);
        List<String> tokens = split(exp.substring(exp.indexOf(" ") + 1, exp.length() - 1));
        
        if (exp.startsWith("(a")) {
            return eval(tokens.get(0), map) + eval(tokens.get(1), map);
        } else if (exp.startsWith("(m")) {
            return eval(tokens.get(0), map) * eval(tokens.get(1), map);
        } else if (exp.startsWith("(l")) {
            for (int i = 0; i < tokens.size() - 1; i = i + 2) {
                map.put(tokens.get(i), eval(tokens.get(i + 1), map));
            }
            return eval(tokens.get(tokens.size() - 1), map);
        }     
        return -1;
    }
                                    
    List<String> split(String exp) {
        List<String> res = new ArrayList<>();
        int count = 0;
        StringBuilder sb = new StringBuilder();
        for (char c: exp.toCharArray()) {
            if (c == '(') {
                count++;
            } else if (c == ')') {
                count--;
            }
            if (count == 0 && c == ' ') {
                res.add(sb.toString());
                sb.delete(0, sb.length());
            } else {
                sb.append(c);
            }
        }
        if (sb.length() > 0) res.add(sb.toString());
        return res;
    }
}
```
