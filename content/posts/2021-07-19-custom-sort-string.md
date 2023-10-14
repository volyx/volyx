---
author: "volyx"
title:  "791. Custom Sort String"
date: "2021-07-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "sort"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[791. Custom Sort String](https://leetcode.com/problems/custom-sort-string/)

You are given two strings order and s. All the words of order are unique and were sorted in some custom order previously.

Permute the characters of s so that they match the order that order was sorted. More specifically, if a character x occurs before a character y in order, then x should occur before y in the permuted string.

Return any permutation of s that satisfies this property.

```txt
Example 1:

Input: order = "cba", s = "abcd"
Output: "cbad"
Explanation: 
"a", "b", "c" appear in order, so the order of "a", "b", "c" should be "c", "b", and "a". 
Since "d" does not appear in order, it can be at any position in the returned string. "dcba", "cdba", "cbda" are also valid outputs.

Example 2:

Input: order = "cbafg", s = "abcd"
Output: "cbad"
```

Constraints:

- 1 <= order.length <= 26
- 1 <= s.length <= 200
- order and s consist of lowercase English letters.
- All the characters of order are unique.

## Solution

```java
class Solution {
    public String customSortString(String order, String s) {
        Map<Character, Integer> orderMap = new HashMap<>();
        
        for (int i = 0; i < order.length(); i++) {
            orderMap.put(order.charAt(i), i);
        }
        int n = orderMap.size();
                
        StringBuilder[] res = new StringBuilder[n + 1];
        
        List<Character> word = new ArrayList<>();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            Integer index = orderMap.get(c);
            
            Integer realIndex = index != null? index: n;
            if (res[realIndex] == null) {
                res[realIndex] = new StringBuilder();
            }
            res[realIndex].append(c);
        }

        
        StringBuilder sb = new StringBuilder();
         for (StringBuilder indexBuilder: res) {
            if (indexBuilder != null) {
                 sb.append(indexBuilder.toString());
            }
        }
        
        return sb.toString();
    }
}
```

## Solution 2022-01-31

```java
class Solution {
    public String customSortString(String order, String s) {
        int[] indexes = new int[256];
        
        for (int i = 0; i < order.length(); i++) {
            indexes[order.charAt(i)] = i;
        }
        
        StringBuilder[] buckets = new StringBuilder[256];
        
        for (char c: s.toCharArray()) {
            int id = indexes[c];
            
            if (buckets[id] == null) {
                buckets[id] = new StringBuilder();
            }
            buckets[id].append(c);
        }
        StringBuilder res = new StringBuilder();
        for (int i = 0; i < buckets.length; i++) {
            if (buckets[i] != null) {
                res.append(buckets[i].toString());
            }
        }
        return res.toString();
    }
         
         
    public String customSortStringSort(String order, String s) {
        int[] indexes = new int[256];
        
        for (int i = 0; i < order.length(); i++) {
            indexes[order.charAt(i)] = i;
        }
        
        List<Character> symbols = new ArrayList<>();
        
        for (char c : s.toCharArray()) {
            symbols.add(c);
        }
        
        Collections.sort(symbols, (a, b) -> {
            return indexes[a] - indexes[b];
        });
        StringBuilder sb = new StringBuilder();
        for (Character c: symbols) {
            sb.append(c);
        }
        return sb.toString();
    }   
}
```
