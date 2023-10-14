---
author: "volyx"
title:  "1192. Critical Connections in a Network"
date: "2021-04-08"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "dfs", "scc", "tarjan"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1514. Path with Maximum Probability](https://leetcode.com/problems/critical-connections-in-a-network/)

There are n servers numbered from 0 to n-1 connected by undirected server-to-server connections forming a network where connections[i] = [a, b] represents a connection between servers a and b. Any server can reach any other server directly or indirectly through the network.

A critical connection is a connection that, if removed, will make some server unable to reach some other server.

Return all critical connections in the network in any order.

```txt
Example 1:

Input: n = 4, connections = [[0,1],[1,2],[2,0],[1,3]]
Output: [[1,3]]
Explanation: [[3,1]] is also accepted.
```

![ex1](/images/2021-04-08-ex1.png)

## Solution

```java
class Solution {
     
     // Brute Force, many DFS , O(E * (N + E)) Time Limit Exceeded
     public List<List<Integer>> criticalConnections2(int n, List<List<Integer>> connections) {
         List<List<Integer>> res = new ArrayList<>();
         for (int skip = 0; skip < connections.size(); skip++) {
             boolean[] visited = new boolean[n];
             int count = 0;
             for (int i = 0; i < n; i++) {
                 if (!visited[i]) {
                     dfs1(i, skip, connections, visited);
                     count++;    
                 }
             }
             if (count != 1) {
                 res.add(connections.get(skip));
             }
         }
         return res;
     }
    
    void dfs1(int i, int skip, List<List<Integer>> connections, boolean[] visited) {
        visited[i] = true;
        
        for (int edgeIndex = 0; edgeIndex < connections.size(); edgeIndex++) {
            if (edgeIndex == skip) continue;
            
            List<Integer> edge = connections.get(edgeIndex);
            
            int a = edge.get(0);
            int b = edge.get(1);
            
            if (a == i && !visited[b]) {
                dfs1(b, skip, connections, visited);
            }
            
            if (b == i && !visited[a]) {
                dfs1(a, skip, connections, visited);
            }
        }
    }
    
    
    List<Integer>[] G;
    int[] disc;
    int[] low;
    List<List<Integer>> res = new ArrayList<>();
    
    public List<List<Integer>> criticalConnections(int n, List<List<Integer>> connections) {        
        disc = new int[n];
        low = new int[n];
        G = build(n, connections);
        dfs(0, -1, 1);
        return res;
    }
    
    void dfs(int node, int parent, int time) {
        disc[node] = time;
        low[node] = time;
        for (int n : G[node]) {
            if (n == parent) continue;
            if (disc[n] == 0) {
                dfs(n, node, ++time);
            }
            low[node] = Math.min(low[node], low[n]);
            if (disc[node] < low[n]) {
               res.add(Arrays.asList(node, n));
            }
        }
    }
    
    List<Integer>[] build(int n, List<List<Integer>> connections) {
        G = new List[n];
        for (int i = 0; i < n; i++) {
            G[i] = new ArrayList<>();
        }
        for (var con: connections) {
            G[con.get(0)].add(con.get(1));
            G[con.get(1)].add(con.get(0));
        }
        return G;
    }
}
```
