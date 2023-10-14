---
author: "volyx"
title:  "301. Remove Invalid Parentheses"
date: "2021-06-06"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "backtracking"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[301. Remove Invalid Parentheses](https://leetcode.com/problems/remove-invalid-parentheses)

Given a string s that contains parentheses and letters, remove the minimum number of invalid parentheses to make the input string valid.

Return all the possible results. You may return the answer in any order.

```txt
Example 1:

Input: s = "()())()"
Output: ["(())()","()()()"]

Example 2:

Input: s = "(a)())()"
Output: ["(a())()","(a)()()"]

Example 3:

Input: s = ")("
Output: [""]
```

Constraints:

- 1 <= s.length <= 25
- s consists of lowercase English letters and parentheses '(' and ')'.
- There will be at most 20 parentheses in s.

## Solution

```java
class Solution {
    public List<String> removeInvalidParentheses(String s) {
        TreeMap<Integer, Set<String>> res = new TreeMap<>();
        
        back(0, s, "", res, 0, 0);
        
        return new ArrayList<>(res.firstEntry().getValue());
    }
    
    void back(int index, String s, String current, 
              Map<Integer, Set<String>> res,
              int open, int closed) {
        
        if (index == s.length()) {
            if (open == closed) {
                int removed = s.length() - current.length();
                Set<String> values = res.getOrDefault(removed, new TreeSet<>());                       values.add(current);  
                res.put(removed, values);
            }
            return;
        }
        
        if (closed > open) return;
        
        char c = s.charAt(index);
        
        if (c == '(' || c == ')') {
            back(index + 1, s, current + c, res,
                 (c == '(') ? open + 1: open, (c == ')') ? closed + 1: closed);
            
            back(index + 1, s, current, res, open, closed);
            
        } else {
            back(index + 1, s, current + c, res, open, closed);
        }   
    }
}
```

## Solution 2021-10-15

```java
class Solution {
    public List<String> removeInvalidParentheses(String s) {
        int opened = 0;
        int closed = 0;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '(') {
                opened++;
            } else if (c == ')') {
                if (opened > 0) {
                    opened--;
                } else {
                    closed++;
                }
            }
        }
        List<String> res = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        backtrack(0, s, res, opened, closed, 0, sb);
        return res;
    }
    
    void backtrack(int pos, String s, List<String> res, int opened, int closed, int currOpened, StringBuilder sb) {
        if (opened < 0 || closed < 0 || currOpened < 0) return;
        if (pos == s.length()) {
            
            if (opened == 0 && closed == 0 && currOpened == 0) {
                if (!res.contains(sb.toString())) {
                   res.add(sb.toString()); 
                } 
            }
            return;
        }
        
        if (opened < 0 || closed < 0 || currOpened < 0) return;
        
        // "()())()"
        //  0123456
        
        // (())() 0 0 0 pos = 2
        char c = s.charAt(pos);
        
        if (c != '(' && c != ')') {
            sb.append(c);
            backtrack(pos + 1, s, res, opened, closed, currOpened, sb);
        }
       
        if (c == '(') {
            // remove
            backtrack(pos + 1, s, res, opened - 1, closed, currOpened, sb);
            //skip
            sb.append(c);
            backtrack(pos + 1, s, res, opened, closed, currOpened + 1, sb);
            
        } else if (c == ')') {
            // remove
            backtrack(pos + 1, s, res, opened, closed - 1, currOpened, sb);
            //skip
            sb.append(c);
            backtrack(pos + 1, s, res, opened, closed, currOpened - 1, sb);
        } 
        sb.deleteCharAt(sb.length() - 1);
    }
}
```

## Solution 2021-10-23

```java
class Solution {
    public List<String> removeInvalidParentheses(String s) {
        int opened = 0;
        int closed = 0;
        
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            
            if (c == '(') {
                opened++;
            } else if (c == ')') {
                if (opened > 0) {
                    opened--;
                } else {
                     closed++;
                }
            }
        }
        
        List<String> res = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        back(s, 0, opened, closed, sb, res, 0, 0);
        
        return res;
    }
    
    void back(String s, int index, 
              int opened, int closed, 
              StringBuilder sb, List<String> res, int currOpen, int currClose) {
        if (opened < 0 || closed < 0) return;
        if (currClose > currOpen) return;
        if (index == s.length()) {
            
            if (closed == 0 && opened == 0) {
                String str = sb.toString();
                if (!res.contains(str)) {
                    res.add(str);
                }
            }
            return;
        }
        char c = s.charAt(index);
        if (c == '(') {
            back(s, index + 1, opened - 1, closed, sb, res, currOpen, currClose);
        } else if (c == ')') {
            back(s, index + 1, opened, closed - 1, sb, res, currOpen, currClose);
        }
        sb.append(c);
        back(s, index + 1, opened, closed, sb, res,
             c == '('? currOpen + 1: currOpen, c == ')'? currClose + 1: currClose);
        sb.deleteCharAt(sb.length() - 1);
    }
}
```

## Solution 2022-01-24

```java
class Solution {
    public List<String> removeInvalidParentheses(String s) {
        StringBuilder sb = new StringBuilder();
        Set<String> res = new HashSet<>();
        int open = 0;
        for (char c: s.toCharArray()) {
            if (c == '(') {
                open++;
            } else if (c == ')') {
                if (open > 0) {
                    open--;
                }
            }
        }
        int close = 0;
        for (int i = s.length() - 1; i >= 0; i--) {
            char c = s.charAt(i);
            if (c == '(') {
                if (close > 0) {
                    close--;
                }
            } else if (c == ')') {
                close++;
            }
        }
        // System.out.println(open + " " + close);
        backtrack(0, s, 0, open, close, sb, res);
        return new ArrayList<>(res);
    }
    
    void backtrack(int index, String s, 
                   int openClosed,
                   int open, int close,
                   StringBuilder sb, Set<String> res) {
        if (open < 0 || close < 0) return;
        if (index == s.length()) {
            if (open == 0 && close == 0) {
                
                res.add(sb.toString());
            }
            return;
        }
        
        char c = s.charAt(index);
        if (c == '(') {
            sb.append(c); // add open
            backtrack(index + 1, s, openClosed + 1, open, close, sb, res);
            sb.deleteCharAt(sb.length() - 1);
            // skip open
            backtrack(index + 1, s, openClosed, open - 1, close, sb, res);
        } else if (c == ')') {
            if (openClosed > 0) {
                sb.append(c); // add close
                backtrack(index + 1, s, openClosed - 1, open, close, sb, res);
                sb.deleteCharAt(sb.length() - 1);
            }
            
            // skip close
            backtrack(index + 1, s, openClosed, open, close - 1, sb, res);
        } else {
            sb.append(c);
            backtrack(index + 1, s, openClosed, open, close, sb, res);
            sb.deleteCharAt(sb.length() - 1);
        }
    }
}
```
