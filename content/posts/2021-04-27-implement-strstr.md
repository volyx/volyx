---
author: "volyx"
title:  "28. Implement strStr()"
date: "2021-04-27"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[28. Implement strStr()](https://leetcode.com/problems/implement-strstr/)

Implement strStr().

Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

Clarification:

What should we return when needle is an empty string? This is a great question to ask during an interview.

For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

```txt
Example 1:

Input: haystack = "hello", needle = "ll"
Output: 2
```

```txt
Example 2:

Input: haystack = "aaaaa", needle = "bba"
Output: -1
```

```txt
Example 3:

Input: haystack = "", needle = ""
Output: 0
```

Constraints:

- 0 <= haystack.length, needle.length <= 5 * 104
- haystack and needle consist of only lower-case English characters.

## Solution

```java
class Solution {
    public int strStr(String haystack, String needle) {
        int[] zi = ziFunction(needle + "#" + haystack);
        int m = needle.length();
        if (m == 0) return 0;
        for (int i = 0; i < zi.length; i++) {
            if (zi[i] == m) {
                return i - m - 1;
            }
        } 
        return -1;
    }
    
    public int strStrNaive(String haystack, String needle) {
        int n = haystack.length();
        int m = needle.length();
        if (m == 0) return 0;
        int i = 0;
        int j = 0;
         while (i < n) {
            if (haystack.charAt(i) == needle.charAt(j)) {
                i++;
                j++;
            } else {
                i = i - j + 1;
                j = 0;
            }
            if (j == m) {
                return i - j;
            } 
        } 
        return -1;
    }
    
    public int strStrKmp(String haystack, String needle) {
        int[] pi = prefixFunction(needle);
        int n = haystack.length();
        int m = needle.length();
        if (m == 0) return 0;
        int i = 0;
        int j = 0;
        while (i < n) {
            if (haystack.charAt(i) == needle.charAt(j)) {
                i++;
                j++;
            } else {
                if (j != 0)  {
                     j = pi[j - 1];
                } else {
                    i++;
                }
            }
            if (j == m){
                return i - j;
            } 
        } 
        return -1;
    }
    
    public int strStrPrefix(String haystack, String needle) {
        int[] pi = prefixFunction(needle + "#" + haystack);
        int m = needle.length();
        for (int i = 0; i < pi.length; i++) {
            if (pi[i] == m) {
                return i - m - m;
            }
        } 
        return -1;
    }
    
    int[] prefixFunction(String s) {
        int n = s.length();
        int[] pi = new int[n];
        
        for (int i = 1; i < n; i++) {
            // текущая длина префикса, который мы хотим продолжить
            // гарантируется, что s[0..j-1] = s[i-j..i-1].
            int j = pi[i - 1];
            
            //пока мы не можем продолжить текущий префикс
            while (j > 0 && s.charAt(i) != s.charAt(j)) { 
                j = pi[j - 1]; //уменьшаем его длину до следующей возможной
            }
            
            //Теперь j - максимальная длина префикса, который мы можем продолжить,
            //или 0, если такового не существует.
            
            if (s.charAt(i) == s.charAt(j)) {
                pi[i] = j + 1;
            } else {
                pi[i] = 0;
            }
        }
        return pi;
    }
    
    int[] ziFunction(String s) {
        int n = s.length();
        int[] zi = new int[n];
        int l = 0;
        for (int i = 1; i < n; i++) {
            //если i входит в уже обработанный отрезок
            //используем предыдущие вычисления
            zi[i] = Math.min(zi[l] + l - i, zi[i - l]); 
            zi[i] = Math.max(0, zi[i]);
            // иначе начальным значением z[i] остаётся 0
            // пытаемся увеличить z[i] наивным алгоритмом
            while (i + zi[i] < n && s.charAt(i + zi[i]) == s.charAt(zi[i])) {
                 zi[i]++;
            }
            //если мы можем увеличить r, делаем это
            if (i + zi[i] > l + zi[l]) {
                l = i;
            }
        }
        return zi;
    }
}
```
