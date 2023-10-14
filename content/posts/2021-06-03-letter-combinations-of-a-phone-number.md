---
author: "volyx"
title:  "17. Letter Combinations of a Phone Number"
date: "2021-06-03"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "backtracking"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[17. Letter Combinations of a Phone Number](https://leetcode.com/problems/letter-combinations-of-a-phone-number/)

Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

```txt
Example 1:

Input: digits = "23"
Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

Example 2:

Input: digits = ""
Output: []

Example 3:

Input: digits = "2"
Output: ["a","b","c"]
```

![ex1](/images/2021-06-03-ex1.png)

Constraints:

- 0 <= digits.length <= 4
- digits[i] is a digit in the range ['2', '9']

## Solution

```java
class Solution {
    
    public List<String> letterCombinations(String digits) {
        Map<Character, String> map = new HashMap<>();
        
        map.put('1', "");
        map.put('2', "abc");
        map.put('3', "def");
        map.put('4', "ghi");
        map.put('5', "jkl");
        map.put('6', "mno");
        map.put('7', "pqrs");
        map.put('8', "tuv");
        map.put('9', "wxyz");
        
        List<String> res = new ArrayList<>();
        
        if (digits.length() == 0) return res;
        
        dfs(digits, 0, "", map, res);
        
        return res;
    }
    
    void dfs(String digits, int index, String s, Map<Character, String> map, List<String> res) {
        if (index == digits.length()) {
            res.add(s);
            return;
        }
        String options = map.get(digits.charAt(index));
        for (int i = 0; i < options.length(); i++) {
            dfs(digits, index + 1, s + options.charAt(i), map, res);
        }
    }
}
```
