---
author: "volyx"
title:  "1584. Min Cost to Connect All Points"
date: "2021-04-06"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1584. Min Cost to Connect All Points](https://leetcode.com/problems/min-cost-to-connect-all-points/)

You are given an array points representing integer coordinates of some points on a 2D-plane, where points[i] = [xi, yi].

The cost of connecting two points [xi, yi] and [xj, yj] is the manhattan distance between them: |xi - xj| + |yi - yj|, where |val| denotes the absolute value of val.

Return the minimum cost to make all points connected. All points are connected if there is exactly one simple path between any two points.

```txt
Example 1:

Input: points = [[0,0],[2,2],[3,10],[5,2],[7,0]]
Output: 20
Explanation:

We can connect the points as shown above to get the minimum cost of 20.
Notice that there is a unique path between every pair of points.
```

![ex1](/images/2021-04-07-ex1.png)

![ex2](/images/2021-04-07-ex2.png)

```txt
Example 2:

Input: points = [[3,12],[-2,5],[-4,1]]
Output: 18
```

```txt
Example 3:

Input: points = [[0,0],[1,1],[1,0],[-1,1]]
Output: 4
```

```txt
Example 4:

Input: points = [[-1000000,-1000000],[1000000,1000000]]
Output: 4000000
```

```txt
Example 5:

Input: points = [[0,0]]
Output: 0
```

Constraints:

- 1 <= points.length <= 1000
- -106 <= xi, yi <= 106
- All pairs (xi, yi) are distinct.

## Solution

```java
class Solution {
    int[] a;
    public int minCostConnectPoints(int[][] points) {
        int n = points.length;
        a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = i;
        }
        PriorityQueue<Edge> pq = new PriorityQueue<>();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i != j)  {
                    int[] a = points[i];
                    int[] b = points[j];
                    int w = Math.abs(a[0] - b[0]) + Math.abs(a[1] - b[1]);
                    pq.add(new Edge(i, j, w));
                }
            }
        }
        
        int sum = 0;
        while (pq.size() > 0) {
            Edge e = pq.poll();
            if (!same(e.a, e.b)) {
                union(e.a, e.b);
                sum += e.w;
            }
        }        
        return sum;
    }
    
    boolean same(int p, int q) {
        return find(p) == find(q);
    }
    
    int find(int p) {
        while (a[p] != p) {
            p = a[p];
            a[p] = a[a[p]];
        }
        return p;
    }
    
    void union(int p, int q) {
        int pid = find(p);
        int qid = find(q);
        
        a[qid] = pid;
    }
    
    class Edge implements Comparable<Edge> {
        int a;
        int b;
        int w;
        
        public Edge(int a, int b, int w) {
            this.a = a;
            this.b = b;
            this.w = w;
        }
        
        public int compareTo(Edge other) {
            return Integer.compare(this.w, other.w);
        }
    }
}
```
