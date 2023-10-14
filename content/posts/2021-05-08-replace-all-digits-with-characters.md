---
author: "volyx"
title:  "1844. Replace All Digits with Characters"
date: "2021-05-08"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1844. Replace All Digits with Characters](https://leetcode.com/problems/replace-all-digits-with-characters/)

You are given a 0-indexed string s that has lowercase English letters in its even indices and digits in its odd indices.

There is a function shift(c, x), where c is a character and x is a digit, that returns the xth character after c.

- For example, shift('a', 5) = 'f' and shift('x', 0) = 'x'.

For every odd index i, you want to replace the digit s[i] with shift(s[i-1], s[i]).

Return s after replacing all digits. It is guaranteed that shift(s[i-1], s[i]) will never exceed 'z'.

```txt
Example 1:

Input: s = "a1c1e1"
Output: "abcdef"
Explanation: The digits are replaced as follows:
- s[1] -> shift('a',1) = 'b'
- s[3] -> shift('c',1) = 'd'
- s[5] -> shift('e',1) = 'f'
```

```txt
Example 2:

Input: s = "a1b2c3d4e"
Output: "abbdcfdhe"
Explanation: The digits are replaced as follows:
- s[1] -> shift('a',1) = 'b'
- s[3] -> shift('b',2) = 'd'
- s[5] -> shift('c',3) = 'f'
- s[7] -> shift('d',4) = 'h'
```

Constraints:

- 1 <= s.length <= 100
- s consists only of lowercase English letters and digits.
- shift(s[i-1], s[i]) <= 'z' for all odd indices i.

## Solution

```java
class Solution {
     public String replaceDigits(String s) {
        char[] charArr = s.toCharArray();
        for (int i = 1; i < charArr.length; i = i + 2) {
            charArr[i] = (char) (charArr[i - 1] + charArr[i] - '0');
        }
        return String.valueOf(charArr);
    }
    public String replaceDigits2(String s) {
        char[] ALPHABET = new char[256];
        for (char i = 'a'; i <= 'z'; i++) {
            ALPHABET[i] = i;
        }
        StringBuilder sb = new StringBuilder();
        int n = s.length();
        for (int i = 0; i < n; i++) {
            char c = s.charAt(i);
            
            if (c >= 'a' && c <= 'z') {
                sb.append(c);
            } else {
                int d = c - '0';
                int prev = ALPHABET[s.charAt(i - 1)];
                char newChar = ALPHABET[prev + d];
                sb.append(newChar);
            }
        }
        return sb.toString();
    }
}
```
