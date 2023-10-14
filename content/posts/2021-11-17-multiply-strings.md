---
author: "volyx"
title:  "43. Multiply Strings"
date: "2021-11-17"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "fb", "array", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![43. Multiply Strings](https://leetcode.com/problems/multiply-strings/)

Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

```txt
Example 1:

Input: num1 = "2", num2 = "3"
Output: "6"

Example 2:

Input: num1 = "123", num2 = "456"
Output: "56088"
```

Constraints:

- 1 <= num1.length, num2.length <= 200
- num1 and num2 consist of digits only.
- Both num1 and num2 do not contain any leading zero, except the number 0 itself.

## Solution

```java
class Solution {
    public String multiply(String num1, String num2) {
        int[] products = new int[num1.length() + num2.length()];
        
        for (int i = 0; i < num1.length(); i++) {
            for (int j = 0; j < num2.length(); j++) {
                int d1 = num1.charAt(i) - '0';
                int d2 = num2.charAt(j) - '0';
                
                products[i + j + 1] += d1 * d2;
                
            }
        }
        
        int carry = 0;
        for (int i = products.length - 1; i >= 0; i--) {
            int tmp = (products[i] + carry) % 10;
            carry = (products[i] + carry) / 10;
            products[i] = tmp;
        }
        StringBuilder sb = new StringBuilder();
        
        for (int product: products) {
            if (product == 0 && sb.length() == 0) {
                continue;
            }
            sb.append(product);
        }
        if (sb.length() == 0) {
            sb.append("0");
        }
        return sb.toString();
    }
}

```
