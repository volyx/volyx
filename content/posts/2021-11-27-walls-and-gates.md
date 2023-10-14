---
author: "volyx"
title:  "286. Walls and Gates"
date: "2021-11-27"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "bfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![286. Walls and Gates](https://leetcode.com/problems/walls-and-gates/)

You are given an m x n grid rooms initialized with these three possible values.

- -1 A wall or an obstacle.
- 0 A gate.
- INF Infinity means an empty room. We use the value 231 - 1 = 2147483647 to represent INF as you may assume that the distance to a gate is less than 2147483647.

Fill each empty room with the distance to its nearest gate. If it is impossible to reach a gate, it should be filled with INF.

![ex1](/images/2021-11-27-walls-and-gates.jpg)

```txt
Example 1:

Input: rooms = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
Output: [[3,-1,0,1],[2,2,1,-1],[1,-1,2,-1],[0,-1,3,4]]
```

```txt
Example 2:

Input: rooms = [[-1]]
Output: [[-1]]

Example 3:

Input: rooms = [[2147483647]]
Output: [[2147483647]]

Example 4:

Input: rooms = [[0]]
Output: [[0]]
```

Constraints:

- m == rooms.length
- n == rooms[i].length
- 1 <= m, n <= 250
- rooms[i][j] is -1, 0, or 2^31 - 1.

## Solution

```java
class Solution {
    int[] DIRS = new int[] {0, 1, 0, -1, 0};
    
    public void wallsAndGates(int[][] rooms) {
        int m = rooms.length;
        int n = rooms[0].length;
        Queue<int[]> q = new ArrayDeque<>();
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (rooms[i][j] == 0) {
                    q.add(new int[] {i, j});
                }
            }
        }
        while (q.size() > 0) {
            int[] point = q.poll();
            int row = point[0];
            int col = point[1];
            for (int i = 0; i < DIRS.length - 1; i++) {
                 int x = row + DIRS[i];
                 int y = col + DIRS[i + 1];
                 if (x < 0 || x >= m || y < 0 || y >= n || rooms[x][y] != Integer.MAX_VALUE) {
                     continue;
                 }
                 rooms[x][y] = rooms[row][col] + 1;
                 q.add(new int[] {x, y});
            }
        }
    }
}
```
