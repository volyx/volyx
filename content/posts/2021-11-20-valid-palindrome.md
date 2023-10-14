---
author: "volyx"
title:  "125. Valid Palindrome"
date: "2021-11-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![125. Valid Palindrome](https://leetcode.com/problems/valid-palindrome/)

A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string s, return true if it is a palindrome, or false otherwise.

```txt
Example 1:

Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.
```

```txt
Example 2:

Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.
```

```txt
Example 3:

Input: s = " "
Output: true
Explanation: s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.
```

Constraints:

- 1 <= s.length <= 2 * 10^5
- s consists only of printable ASCII characters.

## Solution

```java
class Solution {
    public boolean isPalindrome(String s) {
        int lo = 0;
        int hi = s.length() - 1;
        
        while (lo < hi) {
            char loChar = s.charAt(lo);
            if (!Character.isLetterOrDigit(loChar)) {
                lo++;
                continue;
            }
            
            char hiChar = s.charAt(hi);
            if (!Character.isLetterOrDigit(hiChar)) {
                hi--;
                continue;
            }
            
            loChar = Character.isUpperCase(loChar)? Character.toLowerCase(loChar): loChar;
            hiChar = Character.isUpperCase(hiChar)? Character.toLowerCase(hiChar): hiChar;
            
            if (loChar == hiChar) {
                lo++;
                hi--;
                continue;
            } else {
                return false;
            }
        }
        return true;
    }
}
```

## Solution 2021-01-30

```java
class Solution {
    public boolean isPalindrome(String s) {
        int lo = 0;
        int hi = s.length() - 1;
        
        while (lo < hi) {
            char left = s.charAt(lo);
            char right = s.charAt(hi);
            if (!Character.isLetterOrDigit(left)) {
                lo++;
                continue;
            }
            if (!Character.isLetterOrDigit(right)) {
                hi--;
                continue;
            }
            if (Character.isUpperCase(left)) {
                left = Character.toLowerCase(left);
            }
            if (Character.isUpperCase(right)) {
                right = Character.toLowerCase(right);
            }
            if (left != right) {
                return false;
            }
            lo++;
            hi--;
        }
        return true;
    }
}
```

