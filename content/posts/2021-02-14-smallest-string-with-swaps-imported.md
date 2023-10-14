---
author: "volyx"
title:  "1202. Smallest String With Swaps"
date: "2021-02-14"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "union-find"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/smallest-string-with-swaps/]

You are given a string s, and an array of pairs of indices in the string pairs where pairs[i] = [a, b] indicates 2 indices(0-indexed) of the string.

You can swap the characters at any pair of indices in the given pairs any number of times.

Return the lexicographically smallest string that s can be changed to after using the swaps.

```txt
Example 1:

Input: s = "dcab", pairs = [[0,3],[1,2]]
Output: "bacd"
Explaination: 
Swap s[0] and s[3], s = "bcad"
Swap s[1] and s[2], s = "bacd"
```

```txt
Example 2:

Input: s = "dcab", pairs = [[0,3],[1,2],[0,2]]
Output: "abcd"
Explaination: 
Swap s[0] and s[3], s = "bcad"
Swap s[0] and s[2], s = "acbd"
Swap s[1] and s[2], s = "abcd"
```

```txt
Example 3:

Input: s = "cba", pairs = [[0,1],[1,2]]
Output: "abc"
Explaination: 
Swap s[0] and s[1], s = "bca"
Swap s[1] and s[2], s = "bac"
Swap s[0] and s[1], s = "abc"
```

Constraints:

- 1 <= s.length <= 10^5
- 0 <= pairs.length <= 10^5
- 0 <= pairs[i][0], pairs[i][1] < s.length
- s only contains lower case English letters.

```java
class Solution {
    public String smallestStringWithSwaps(String s, List<List<Integer>> pairs) {
        int n = s.length();
        UF uf = new UF(n);
        
        for (int i = 0; i < pairs.size(); i++) {
            List<Integer> pair = pairs.get(i);
            uf.union(pair.get(0), pair.get(1));
        }
        
        Map<Integer, List<Character>> idToChars = new HashMap<>();
        for (int i = 0; i < n; i++) {
            int id = uf.find(i);
            List<Character> chars = idToChars.getOrDefault(id, new ArrayList<>());
            chars.add(s.charAt(i));
            idToChars.put(id, chars);
        }
        
        for (Integer id: idToChars.keySet()) {
            List<Character> chars = idToChars.get(id);
            Collections.sort(chars);
            idToChars.put(id, chars);
        }
        
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < n; i++) {
            int id = uf.find(i);
            sb.append(idToChars.get(id).remove(0));
        }
        return sb.toString();
    }
    
    public class UF {
        
        int[] a;
        int[] sz;
        
        public UF(int n) {
            this.a = new int[n];
            this.sz = new int[n];
            for (int i = 0; i < n; i++) {
                a[i] = i;
                sz[i] = 1;
            }
        }
        
        void union(int p, int q) {
            int pid = find(p);
            int qid = find(q);
            
            if (pid == qid) {
                return;
            }
            
            if (sz[pid] >= sz[qid]) {
                a[qid] = pid;
                sz[pid] += sz[qid];
            } else {
                a[pid] = qid;
                sz[qid] += sz[pid];
            }
        }
        
        int find(int p) {
            while (p != a[p]) {
                p = a[p];
            }
            return p;
        }
    }   
}
