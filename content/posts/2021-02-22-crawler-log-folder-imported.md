---
author: "volyx"
title:  "1598. Crawler Log Folder"
date: "2021-02-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/crawler-log-folder/]

The Leetcode file system keeps a log each time some user performs a change folder operation.

The operations are described below:

- "../" : Move to the parent folder of the current folder. (If you are already in the main folder, remain in the same folder).
- "./" : Remain in the same folder.
- "x/" : Move to the child folder named x (This folder is guaranteed to always exist).

You are given a list of strings logs where logs[i] is the operation performed by the user at the ith step.

The file system starts in the main folder, then the operations in logs are performed.

Return the minimum number of operations needed to go back to the main folder after the change folder operations.

![ex1](/images/2021-02-22-logs-ex1.jpg)

```txt
Example 1:

Input: logs = ["d1/","d2/","../","d21/","./"]
Output: 2
Explanation: Use this change folder operation "../" 2 times and go back to the main folder.
```

![ex2](/images/2021-02-22-logs-ex2.jpg)

```txt
Example 2:

Input: logs = ["d1/","d2/","./","d3/","../","d31/"]
Output: 3

Example 3:

Input: logs = ["d1/","../","../","../"]
Output: 0
```

Constraints:

- 1 <= logs.length <= 103
- 2 <= logs[i].length <= 10
- logs[i] contains lowercase English letters, digits, '.', and '/'.
- logs[i] follows the format described in the statement.
- Folder names consist of lowercase English letters and digits.


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
