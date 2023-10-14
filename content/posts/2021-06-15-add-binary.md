---
author: "volyx"
title:  "67. Add Binary"
date: "2021-06-14"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "two-pointers"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[67. Add Binary](https://leetcode.com/problems/add-binary/)

Given two binary strings a and b, return their sum as a binary string.

```txt
Example 1:

Input: a = "11", b = "1"
Output: "100"

Example 2:

Input: a = "1010", b = "1011"
Output: "10101"
```

Constraints:

- 1 <= a.length, b.length <= 104
- a and b consist only of '0' or '1' characters.
- Each string does not contain leading zeros except for the zero itself.

## Solution

```java
class Solution {
   public String addBinary(String a, String b) {
        int i = a.length() - 1;
        int j = b.length() - 1;
        
        int carry = 0;
        StringBuilder sb = new StringBuilder();
        while (i >= 0 || j >= 0) {
            
            int c1 = (i >= 0) ? a.charAt(i) - '0': 0;
            int c2 = (j >= 0) ? b.charAt(j) - '0': 0;
            
            int c3 = c1 + c2 + carry;
            
            if (carry > 0) {
                carry = 0;
            }
            if (c3 == 3) {
                carry = 1;
                sb.insert(0, '1');
            } else if (c3 == 2) {
                carry = 1;
                sb.insert(0, '0');
            } else if (c3 == 1) {
                sb.insert(0, '1');
            } else {
                sb.insert(0, '0');
            }
            i--;
            j--;
        }
       
        if (carry > 0) {
             sb.insert(0, '1');
        }
       return sb.toString();
    }
    public String addBinary2(String a, String b) {
        Integer i1 = Integer.parseInt(a, 2);
        Integer i2 = Integer.parseInt(b, 2);
        
        return Integer.toBinaryString(i1 + i2);
    }
}
```
