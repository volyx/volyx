---
author: "volyx"
title:  "83. Remove Duplicates from Sorted List"
date: "2021-06-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "linked-list"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1625. Lexicographically Smallest String After Applying Operations](https://leetcode.com/problems/remove-duplicates-from-sorted-list/)

Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

```txt
Example 1:

Input: head = [1,1,2]
Output: [1,2]
```

![ex1](/images/2021-06-22-ex1.jpg)

```txt
Example 2:

Input: head = [1,1,2,3,3]
Output: [1,2,3]
```

![ex2](/images/2021-06-22-ex2.jpg)

Constraints:

- The number of nodes in the list is in the range [0, 300].
- -100 <= Node.val <= 100
- The list is guaranteed to be sorted in ascending order.

## Solution

```java
class Solution {
    String smallest = null;
    public String findLexSmallestString(String s, int a, int b) {
        smallest = s;
        Set<String> set = new HashSet<>();
        dfs(s, set, a, b);
        return smallest;
    }
    
    void dfs(String current, Set<String> set, int a, int b) {
        if (set.contains(current)) {
            return;
        }
        
        set.add(current);
        
        if (current.compareTo(smallest) < 0) {
            smallest = current;
        }
        
        dfs(add(current, a), set, a, b);
        dfs(rotate(current, b), set, a, b);
    }
    
    String add(String s, int a) {
        StringBuilder sb = new StringBuilder(s);
        for (int i = 1; i < s.length(); i += 2) {
            char c = sb.charAt(i);
            
            int value = c - '0';
            value += a;
            
            value = value % 10;
            sb.deleteCharAt(i);
            sb.insert(i, value);
        }
        return sb.toString();
    }
    
    String rotate(String s, int b) { 
        int len = s.length();
        return s.substring(len - b, len) + s.substring(0, len - b);
    }
}
```
