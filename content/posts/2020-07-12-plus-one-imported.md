---
author: "volyx"
title:  "Plus One"
date: "2020-07-12"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a non-empty array of digits representing a non-negative integer, increment one to the integer.

The digits are stored such that the most significant digit is at the head of the list, and each element in the array contains a single digit.

You may assume the integer does not contain any leading zero, except the number 0 itself.

Example 1:
```
Input: [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.
```

Example 2:
```
Input: [4,3,2,1]
Output: [4,3,2,2]
Explanation: The array represents the integer 4321.
```

Solution:

```java
class Solution {
    
    public int[] plusOne(int[] digits) {
        int n = digits.length;
        for (int i = digits.length - 1; i >= 0; i--) {
            if (digits[i] != 9) {
                digits[i]++;
                return digits;
            } else {
                digits[i] = 0;
            }
        }
        
        int[] newDigits = new int[n + 1];
        newDigits[0] = 1;
        for (int i = 1; i < n + 1; i++) {
            newDigits[i] = digits[i - 1];
        }
        digits = newDigits;
        return digits;
    }
    
    public int[] plusOne2(int[] digits) {
        
        int carry = 0;
        
        int n = digits.length;
        
        if (digits[n - 1] == 9) {
            carry = 1;         
        } else {
            digits[n - 1]++;
            return digits;
        }
        
        // 19 9 + 1 = 10 
        // 10
        // 20
        for (int i = n - 1; i >= 0; i--) {
            if (carry > 0) {
                int value = digits[i] + carry;
                digits[i] = value % 10;
                carry = value / 10;
            } else {
                break;
            }
        }
        
        if (carry == 1) {
            int[] newDigits = new int[n + 1];
            newDigits[0] = 1;
            for (int i = 1; i < n + 1; i++) {
                newDigits[i] = digits[i - 1];
            }
            digits = newDigits;
        }
        return digits;
    }
