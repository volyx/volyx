---
author: "volyx"
title:  "227. Basic Calculator II"
date: "2021-02-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/basic-calculator-ii/]

Given a string s which represents an expression, evaluate this expression and return its value. 

The integer division should truncate toward zero.

```txt
Example 1:

Input: s = "3+2*2"
Output: 7

Example 2:

Input: s = " 3/2 "
Output: 1

Example 3:

Input: s = " 3+5 / 2 "
Output: 5
```

Constraints:

- 1 <= s.length <= 3 * 105
- s consists of integers and operators ('+', '-', '*', '/') separated by some number of spaces.
- s represents a valid expression.
- All the integers in the expression are non-negative integers in the range [0, 231 - 1].
- The answer is guaranteed to fit in a 32-bit integer.

```java
class Solution {
    public int calculate(String s) {
        
        var values = new int[s.length()];
        var signs = new char[s.length()];
        
        int valuesSize = 0;
        int signsSize = 0;
            
        char[] symbols = s.toCharArray();
        
        for (int i = 0; i < symbols.length; i++) {
            char c = symbols[i];
            if (c == ' ') {
    			continue;
    		}

    		if (Character.isDigit(c)) {
    			int j = i;
    			int val = 0;
    			while (j < symbols.length && Character.isDigit(symbols[j])) {
    				val = (val * 10) + (symbols[j] - '0');
                    j++;
    			}
                i = j - 1;
    			if (signsSize > 0) {
    				char op = signs[signsSize - 1];
    				if (op == '*' || op == '/') {
                        signsSize--;
    					int prev = values[valuesSize - 1];
                        valuesSize--;
    					if (op == '*') {
    						val = val * prev;
    					} else {
    						val = prev / val;
    					}
                    }
                }
    			values[valuesSize++] = val;
    		} else {
    			signs[signsSize++] = c;
    		}
            // System.out.println("signs = " + Arrays.toString(signs));
            // System.out.println("values = " + Arrays.toString(values));
    	}
        
        int j = 0;
        int res = values[0];
        for (int i = 0; i < valuesSize - 1; i++) {
            char op = signs[j++];
            int a = values[i];
			int b = values[i + 1];
            res = (op == '+') ? a + b : a - b;
            values[i  + 1] = res;
        }

    	return res;
    }
}
