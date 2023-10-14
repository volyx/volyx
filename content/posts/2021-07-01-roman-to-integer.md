---
author: "volyx"
title:  "13. Roman to Integer"
date: "2021-07-01"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "math"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[13. Roman to Integer](https://leetcode.com/problems/roman-to-integer/)

Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000

For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

- I can be placed before V (5) and X (10) to make 4 and 9.
- X can be placed before L (50) and C (100) to make 40 and 90.
- C can be placed before D (500) and M (1000) to make 400 and 900.

Given a roman numeral, convert it to an integer.

```txt
Example 1:

Input: s = "III"
Output: 3

Example 2:

Input: s = "IV"
Output: 4

Example 3:

Input: s = "IX"
Output: 9

Example 4:

Input: s = "LVIII"
Output: 58
Explanation: L = 50, V= 5, III = 3.

Example 5:

Input: s = "MCMXCIV"
Output: 1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
```

Constraints:

- 1 <= s.length <= 15
- s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
- It is guaranteed that s is a valid roman numeral in the range [1, 3999].

## Solution

```java
class Solution {
    public int romanToInt(String s) {
        Map<String, Integer> map = Map.of(
            "I", 1,
            "V", 5,
            "X", 10,
            "L", 50,
            "C", 100,
            "D", 500,
            "M", 1000
        );
        
        int res = 0;
        for (int i = 0; i < s.length(); i++) {
            if (i > 0 && map.get(s.charAt(i) + "") > map.get(s.charAt(i - 1) + "")) {
                 res -= 2* map.get(s.charAt(i - 1) + "");
            }
            res += map.get(s.charAt(i) + "");        
        }
        return res;
    }
}
```

## Solution 1.08.2021

```
class Solution {
    
    static String[] I = new String[] {"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"};
    static String[] X = new String[] {"X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"};
    static String[] C = new String[] {"C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"};
    static String[] M = new String[] {"M", "MM", "MMM"};
    
    static String[][] ALL = new String[][] {
        I, // 0
        X, // 1
        C, // 2
        M // 3
    };
    
    public int romanToInt(String s) {
        int res = 0;
        int len = s.length();
        int i = 0;
        while (i < len) {
            boolean found = false;
            for (int j = ALL.length - 1; j >= 0; j--) {
                String[] values = ALL[j];
                
                for (int k = values.length - 1; k >= 0; k--) {
                    String val = values[k];
                    if (i + val.length() > len) continue;
                    if (s.substring(i, i + val.length()).equals(val)) {
                        res += pow(10, j) * (k + 1); 
                        found = true;
                        // System.out.println("\t" + val + " res " + res);
                        i += val.length();
                        break;
                    }
                }
                
                if (found) {
                    break;
                }
            }
        }
        
        return res;
    }
    
    int pow(int a, int b) {
        return (int) Math.pow(a, b);
    }
}
```
