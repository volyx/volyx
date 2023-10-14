---
author: "volyx"
title:  "415. Add Strings"
date: "2021-10-09"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "math"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![415. Add Strings](https://leetcode.com/problems/add-strings/)

Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.

You must solve the problem without using any built-in library for handling large integers (such as BigInteger). You must also not convert the inputs to integers directly.

```txt
Example 1:

Input: num1 = "11", num2 = "123"
Output: "134"

Example 2:

Input: num1 = "456", num2 = "77"
Output: "533"

Example 3:

Input: num1 = "0", num2 = "0"
Output: "0"
```

Constraints:

- 1 <= num1.length, num2.length <= 104
- num1 and num2 consist of only digits.
- num1 and num2 don't have any leading zeros except for the zero itself.

## Solution

```java
class Solution {
    public String addStrings(String num1, String num2) {
        int carry = 0;
        
        int idx1 = num1.length() - 1;
        int idx2 = num2.length() - 1;
        
        StringBuilder sb = new StringBuilder();
        
        while (idx1 >= 0 || idx2 >= 0) {
            int digit1 = (idx1 >= 0) ? num1.charAt(idx1) - '0': 0; // 0 1
            int digit2 = (idx2 >= 0) ? num2.charAt(idx2) - '0': 0; // 1 2
            
            // 4 = 1 + 3
            // 3 = 1 + 2
            int value = digit1 + digit2 + carry;
            
            carry = value / 10;
            
            value = value % 10;
            
            sb.append(value);
            
            idx1--;
            idx2--;
        }
        
        if (carry == 1) {
            sb.append(1);
        }
        
        return sb.reverse().toString();
    }
}
```

## Solution 2021-10-20

```java
class Solution {
    public String addStrings(String num1, String num2) {
        int carry = 0;
        
       int len1 = num1.length();
       int len2 = num2.length();
        
       int i = len1 - 1; 
       int j = len2 - 1; 
       StringBuilder sb = new StringBuilder(); 
       while (i >= 0 || j >= 0) {
           
           int c1 = i >= 0 ? num1.charAt(i) - '0' : 0;
           int c2 = j >= 0 ? num2.charAt(j) - '0': 0;
           
           int val = c1 + c2 + carry;
           
           carry = val / 10;
           val = val % 10;
           sb.append(val);
           i--;
           j--;
       } 
        
       if (carry > 0) {
           sb.append(carry);
       } 
        
        return sb.reverse().toString();
    }
}
```
