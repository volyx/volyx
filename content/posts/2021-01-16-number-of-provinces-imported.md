---
author: "volyx"
title:  "547. Number of Provinces"
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

![https://leetcode.com/problems/number-of-provinces/]

There are n cities. Some of them are connected, while some are not. If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c.

A province is a group of directly or indirectly connected cities and no other cities outside of the group.

You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city and the jth city are directly connected, and isConnected[i][j] = 0 otherwise.

Return the total number of provinces.

Example 1:

![ex1](/images/2021-01-16-ex1.jpg)

Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
Output: 2

Example 2:

![ex1](/images/2021-01-16-ex2.jpg)

Input: isConnected = [[1,0,0],[0,1,0],[0,0,1]]
Output: 3

Solution:

```java
class Solution {
    int n;
    public int findCircleNum(int[][] isConnected) {
        n = isConnected.length;
        
        UF uf = new UF(n);
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                
                if (isConnected[i][j] == 1) {
                    uf.union(i, j);
                }
            }
            
        }
        return uf.count();
    }
    
    private class UF {
        private final int[] a;
        private final int[] sz;
        
        public UF(int n) {
            this.a = new int[n];
            this.sz = new int[n];
            
            for (int i = 0; i < n; i++) { 
                this.a[i] = i;
                this.sz[i] = 1;
            }
        }
        
        int find(int p) {
            while (a[p] != p) {
                p = a[p];
            }
            return p;
        }
        
        void union(int p, int q) {
            int pid = find(p);
            int piq = find(q);
            
            if (sz[pid] >= sz[piq]) {
                a[piq] = pid;
                sz[pid]+=sz[piq];
            } else {
                a[pid] = piq;
                sz[piq] += pid;
            }
        }
        
        int count() {
            int counter = 0;
            for (int i = 0; i < n; i++) {
                if (a[i] == i) {
                    counter++;
                }
                
            }
            return counter;
        }
    }
}
