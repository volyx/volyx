---
author: "volyx"
title:  "Complement of Base 10 Integer"
date: "2020-05-25"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Every non-negative integer N has a binary representation.  For example, 5 can be represented as "101" in binary, 11 as "1011" in binary, and so on.  Note that except for N = 0, there are no leading zeroes in any binary representation.

The complement of a binary representation is the number in binary you get when changing every 1 to a 0 and 0 to a 1.  For example, the complement of "101" in binary is "010" in binary.

For a given number N in base-10, return the complement of it's binary representation as a base-10 integer.

Example 1:
```
Input: 5
Output: 2
Explanation: 5 is "101" in binary, with complement "010" in binary, which is 2 in base-10.
```

Example 2:
```
Input: 7
Output: 0
Explanation: 7 is "111" in binary, with complement "000" in binary, which is 0 in base-10.
```

Example 3:
```
Input: 10
Output: 5
Explanation: 10 is "1010" in binary, with complement "0101" in binary, which is 5 in base-10.
```
 

Note:
```
    0 <= N < 10^9
    This question is the same as 476: https://leetcode.com/problems/number-complement/
```


Solution: 

```java
/** 
 * Forward declaration of guess API.
 * @param  num   your guess
 * @return 	     -1 if num is lower than the guess number
 *			      1 if num is higher than the guess number
 *               otherwise return 0
 * int guess(int num);
 */

class Solution {
    public int bitwiseComplement(int N) {
        StringBuilder sb = new StringBuilder();
        String binary = Integer.toString(N, 2);
        for (int i = 0; i < binary.length(); i++) {
            if (binary.charAt(i) == '0') {
                sb.append('1');
            } else {
                sb.append('0');
            }
        }
        return Integer.valueOf(sb.toString(), 2);
    }

   public int bitwiseComplement2(int N) {
        int result = 0;
        int power = 1;
        while (N > 0) {
            result += (N % 2 ^ 1) * power;
            power <<= 1;
            N >>= 1;
        }
        return result;
    }
}
