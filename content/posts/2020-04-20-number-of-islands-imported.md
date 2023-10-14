---
author: "volyx"
title:  "Number of Islands"
date: "2020-04-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

```txt
Example 1:

Input:
11110
11010
11000
00000

Output: 1

```txt
Example 2:

Input:
11000
11000
00100
00011

Output: 3
```

```java
class Solution {
    public int numIslands(char[][] grid) {
        int count = 0;
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[i].length; j++) {
                if (grid[i][j] == '1') {
                    count++;
                    bfs(grid, i, j);
                }
            }
        }
        return count;
    }

    void bfs(char[][] grid, int i, int j) {
        if (i < 0 || i >= grid.length) {
            return;
        }
        if (j < 0 || j >= grid[i].length) {
            return;
        }

        if (grid[i][j] == '0') {
            return;
        }

        grid[i][j] = '0';

        bfs(grid, i + 1, j); // up
        bfs(grid, i, j + 1); // right
        bfs(grid, i - 1, j); // down
        bfs(grid, i, j - 1); //left 
    }
}
```

## Solution 2021-10-23

```java
class Solution {
    public int numIslands(char[][] grid) {
        int count = 0;
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[0].length; j++) {
                if (grid[i][j] == '1') {
                    dfs(i, j, grid);
                    count++;
                }
            }
        }
        return count;
    }
    
    int[][] DIRS = new int[][] {
        {1, 0},
        {-1, 0},
        {0, 1},
        {0, -1},
    };
    void dfs(int i, int j, char[][] grid) {
        if (i < 0 || j < 0 || i == grid.length || j == grid[0].length) {
            return;
        }
        
        if (grid[i][j] != '1') {
            return;
        }
        
        grid[i][j] = '0';
        
        for (int[] dir: DIRS) {
            int x = i + dir[0];
            int y = j + dir[1];
            dfs(x, y, grid);
        }
    }
}
```
