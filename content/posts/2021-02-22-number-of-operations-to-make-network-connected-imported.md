---
author: "volyx"
title:  "1319. Number of Operations to Make Network Connected"
date: "2021-02-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "union-find"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/remove-outermost-parentheses/]

There are n computers numbered from 0 to n-1 connected by ethernet cables connections forming a network where connections[i] = [a, b] represents a connection between computers a and b. Any computer can reach any other computer directly or indirectly through the network.

Given an initial computer network connections. You can extract certain cables between two directly connected computers, and place them between any pair of disconnected computers to make them directly connected. Return the minimum number of times you need to do this in order to make all the computers connected. If it's not possible, return -1.

![ex1](/images/2021-02-22-ex1.jpg)

```txt
Example 1:

Input: n = 4, connections = [[0,1],[0,2],[1,2]]
Output: 1
Explanation: Remove cable between computer 1 and 2 and place between computers 1 and 3.
```

![ex2](/images/2021-02-22-ex2.jpg)

```txt
Example 2:

Input: n = 6, connections = [[0,1],[0,2],[0,3],[1,2],[1,3]]
Output: 2
```

```txt
Example 3:

Input: n = 6, connections = [[0,1],[0,2],[0,3],[1,2]]
Output: -1
Explanation: There are not enough cables.

Example 4:

Input: n = 5, connections = [[0,1],[0,2],[3,4],[2,3]]
Output: 0
```

Constraints:

- 1 <= n <= 10^5
- 1 <= connections.length <= min(n*(n-1)/2, 10^5)
- connections[i].length == 2
- 0 <= connections[i][0], connections[i][1] < n
- connections[i][0] != connections[i][1]
- There are no repeated connections.
- No two computers are connected by more than one cable.

```java
class Solution {
    public int makeConnected(int n, int[][] connections) {
        UF uf = new UF(n);
        int extra = 0;
        for (int i = 0; i < connections.length; i++) {
            int a = connections[i][0];
            int b = connections[i][1];
            if (uf.union(a, b)) extra++;
            
        }
        int group = 0;
        for (int i = 0; i < n; i++) {
            if (uf.find(i) == i) {
                group++;
            }
        }
        return extra >= group - 1 ? group - 1 : -1;
    }
    
     class UF {
        
        private int[] a;
        
        UF(int n) {
            this.a = new int[n];
            
            for (int i = 0; i < n; i++) {
                a[i] = i;
            }
        }
        
        boolean union(int p, int q) {
            int pid = find(p);
            int qid = find(q);
            
            if (pid == qid) {
                return true;
            }
            
            a[qid] = pid;
            return false;
        }
        
        int find(int p) {
            while (p != a[p]) {
                a[p] = a[a[p]];
                p = a[p];
            }
            return p;
        }
    }
}

class Solution2 {
    public int makeConnected(int n, int[][] connections) {
        if (connections.length < n - 1) {
            return -1;
        }
        UF uf = new UF(n);
        
        for (int i = 0; i < connections.length; i++) {
            int a = connections[i][0];
            int b = connections[i][1];
            uf.union(a, b);
        }
        
        Set<Integer> componentCount = new HashSet<>();
        int free = 0;
        for (int i = 0; i < n; i++) {
            int id = uf.find(i);
            if (componentCount.add(id)) {
                free = free + uf.edges[id] - (uf.size(id) - 1);
            }
        }
        
        if (componentCount.size() == 1) {
            return 0;
        }
        
        int needEdges = componentCount.size() - 1;
        
        if (free >= needEdges) {
            return needEdges;
        } else {
            return 1;
        }
    }
    
    class UF {
        
        private int[] a;
        private int[] sz;
        private int[] edges;
        
        UF(int n) {
            this.a = new int[n];
            this.sz = new int[n];
            this.edges = new int[n];
            
            for (int i = 0; i < n; i++) {
                a[i] = i;
                sz[i] = 1;
            }
        }
        
        void union(int p, int q) {
            int pid = find(p);
            int qid = find(q);
            
            if (pid == qid) {
                edges[qid]++;
                return;
            }
            
            if (sz[pid] > sz[qid]) {
                a[qid] = pid;
                sz[pid] += sz[qid];
                edges[pid] += edges[qid] + 1;
            } else {
                a[pid] = qid;
                sz[qid] += sz[pid];
                edges[qid] += edges[pid] + 1;
            }
        }
        
        int find(int p) {
            while (p != a[p]) {
                a[p] = a[a[p]];
                p = a[p];
            }
            return p;
        }
        
        int size(int p) {
            return sz[find(p)];
        }
    }   
}
