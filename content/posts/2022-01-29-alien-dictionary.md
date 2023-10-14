---
author: "volyx"
title: "269. Alien Dictionary"
date: "2022-01-29"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "bfs", "graph", "topological-sort"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![269. Alien Dictionary](https://leetcode.com/problems/alien-dictionary/)

There is a new alien language that uses the English alphabet. However, the order among the letters is unknown to you.

You are given a list of strings words from the alien language's dictionary, where the strings in words are sorted lexicographically by the rules of this new language.

Return a string of the unique letters in the new alien language sorted in lexicographically increasing order by the new language's rules. If there is no solution, return "". If there are multiple solutions, return any of them.

A string s is lexicographically smaller than a string t if at the first letter where they differ, the letter in s comes before the letter in t in the alien language. If the first min(s.length, t.length) letters are the same, then s is smaller if and only if s.length < t.length.

```txt
Example 1:

Input: words = ["wrt","wrf","er","ett","rftt"]
Output: "wertf"
```

```txt
Example 2:

Input: words = ["z","x"]
Output: "zx"
```

```txt
Example 3:

Input: words = ["z","x","z"]
Output: ""
Explanation: The order is invalid, so return "".
```

Constraints:

- 1 <= words.length <= 100
- 1 <= words[i].length <= 100
- words[i] consists of only lowercase English letters.

## Solution BFS + Topological Sort

```java
class Solution {

    public String alienOrder(String[] words) {
        
        Map<Character, List<Character>> g = new HashMap<>();
        Map<Character, Integer> inDegree = new HashMap();
        for (String word: words) {
            for (char c : word.toCharArray()) {
                g.put(c, new ArrayList<>());
                inDegree.put(c, 0);
            }
        }

        for (int i = 1; i < words.length; i++) {
            String w1 = words[i-1];
            String w2 = words[i];
            if (w1.startsWith(w2) && w1.length() > w2.length()) {
                return "";
            }
            for (int j = 0; j < Math.min(w1.length(), w2.length()); j++) {
                char c1 = w1.charAt(j);
                char c2 = w2.charAt(j);
                if (c1 == c2) {
                    continue;
                } else {
                    g.get(c1).add(c2);
                    inDegree.put(c2, inDegree.getOrDefault(c2, 0) + 1);
                    break;
                }
            }
        }
        
        StringBuilder sb = new StringBuilder();
        Queue<Character> q = new ArrayDeque<>();
        for (Character c: inDegree.keySet()) {
            if (inDegree.get(c).equals(0)) {
                q.add(c);
            }
        }
        
        while (q.size() > 0) {
            Character c = q.poll();
            sb.append(c);
            for (Character nei: g.get(c)) {
                inDegree.put(nei, inDegree.get(nei) - 1);
                if (inDegree.get(nei).equals(0)) {
                    q.add(nei);
                }
            }
        }
        if (sb.length() < inDegree.size()) return "";
        return sb.toString();
    }
}
```
