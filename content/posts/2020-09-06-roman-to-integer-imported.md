---
author: "volyx"
title:  "Roman to Integer"
date: "2020-09-06"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

```txt
Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
```

For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

- I can be placed before V (5) and X (10) to make 4 and 9.
- X can be placed before L (50) and C (100) to make 40 and 90.
- C can be placed before D (500) and M (1000) to make 400 and 900.

Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.

Example 1:

```txt
Input: "III"
Output: 3
```

Example 2:

```txt
Input: "IV"
Output: 4
```

Example 3:

```txt
Input: "IX"
Output: 9
```

Example 4:

```txt
Input: "LVIII"
Output: 58
Explanation: L = 50, V= 5, III = 3.
```

Example 5:

```txt
Input: "MCMXCIV"
Output: 1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
```

Solution:

```java
class Solution {
    public int romanToInt(String roman) {
        Map<Character, Integer> map = Map.of(
            Character.valueOf('V'), 5,
            Character.valueOf('L'), 50,
            Character.valueOf('D'), 500,
            Character.valueOf('M'), 1000
        );
        int value = 0;
        for (int i = 0; i < roman.length(); i++) {
            char c = roman.charAt(i);
            switch (c) {
                case 'I':
                    if (i != roman.length() - 1) {
                        char next = roman.charAt(i + 1);
                        if (next == 'V') {
                            value+= 4;
                            i++;
                            break;
                        } else if (next == 'X') {
                            value+= 9;
                            i++;
                            break;
                        } else {
                             value++;
                        }
                    } else {
                         value++;
                    }
                    break;
                case 'X':
                    if (i != roman.length() - 1) {
                        char next = roman.charAt(i + 1);
                        if (next == 'L') {
                            value+= 40;
                            i++;
                            break;
                        } else if (next == 'C') {
                            value+= 90;
                            i++;
                            break;
                        } else {
                             value+=10;
                        }
                    } else {
                         value+=10;
                    }
                    break;
                case 'C':
                    if (i != roman.length() - 1) {
                        char next = roman.charAt(i + 1);
                        if (next == 'D') {
                            value+= 400;
                            i++;
                            break;
                        } else if (next == 'M') {
                            value+= 900;
                            i++;
                            break;
                        } else {
                            value+=100;
                        }
                    } else {
                         value+=100;
                    }
                    break;
                default:
                    value += map.get(Character.valueOf(c));

            }
        }
        return value;
    }
}
