---
author: "volyx"
title:  "684. Redundant Connection"
date: "2021-01-16"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "union-find"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/redundant-connection/]

In this problem, a tree is an undirected graph that is connected and has no cycles.

The given input is a graph that started as a tree with N nodes (with distinct values 1, 2, ..., N), with one additional edge added. The added edge has two different vertices chosen from 1 to N, and was not an edge that already existed.

The resulting graph is given as a 2D-array of edges. Each element of edges is a pair [u, v] with u < v, that represents an undirected edge connecting nodes u and v.

Return an edge that can be removed so that the resulting graph is a tree of N nodes. If there are multiple answers, return the answer that occurs last in the given 2D-array. The answer edge [u, v] should be in the same format, with u < v.

Example 1:

Input: [[1,2], [1,3], [2,3]]
Output: [2,3]
Explanation: The given undirected graph will be like this:

```txt
  1
 / \
2 - 3
```

Example 2:

Input: [[1,2], [2,3], [3,4], [1,4], [1,5]]
Output: [1,4]
Explanation: The given undirected graph will be like this:

```txt
5 - 1 - 2
    |   |
    4 - 3
```


Note:
The size of the input 2D-array will be between 3 and 1000.
Every integer represented in the 2D-array will be between 1 and N, where N is the size of the input array.
Solution:

```java
class Solution {
    public int[] findRedundantConnection(int[][] edges) {
        
        if (edges.length < 3 || edges.length > 1000) {
            throw new RuntimeException();
        }
        int n = 0;
        for (int i = 0; i < edges.length; i++) {
            n = Math.max(n, edges[i][0]);
            n = Math.max(n, edges[i][1]);
        }
        
        
        for (int j = edges.length - 1; j >= 0; j--) {
            UF uf = new UF(n + 1);
            uf.union(0, 1); 
        
            for (int i = 0; i < edges.length; i++) {
                if (i != j) {
                   uf.union(edges[i][0], edges[i][1]); 
                }
            }
            
            if (uf.count() == 1) {
                return edges[j];
            }
        }
            
        return new int[0];     
    }
    
    class UF {
        private final int n;
        
        private final int[] a;
        private final int[] sz;
        
        public UF(int n) {
            this.n = n ;
            
            this.a = new int[n];
            this.sz = new int[n];
            
            for (int i = 0; i < n; i++) {
                this.a[i] = i;
                this.sz[i] = 1;
            }
        }
        
        void union(int p, int q) {
            int pid = find(p);
            int qid = find(q);
            
            if (sz[pid] >= sz[qid]) {
                a[qid] = pid;
                sz[qid] += sz[pid];
            } else {
                a[pid] = qid;   
                sz[pid] += sz[qid];
            }
        }
        
        int find(int p) {
            while (a[p] != p) {
                p = a[p];
            }
            return p;
        }
        
        int count() {
            int c = 0;
            
            for (int i = 0; i < n; i++) {
                if (a[i] == i) {
                    c++;
                }
            }
            return c;
        }
     }
}
