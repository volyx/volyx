---
author: "volyx"
title:  "694. Number of Distinct Islands"
date: "2021-10-02"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![694. Number of Distinct Islands](https://leetcode.com/problems/number-of-distinct-islands/)

You are given an m x n binary matrix grid. An island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

An island is considered to be the same as another if and only if one island can be translated (and not rotated or reflected) to equal the other.

Return the number of distinct islands.

```txt
Example 1:

Input: grid = [[1,1,0,0,0],[1,1,0,0,0],[0,0,0,1,1],[0,0,0,1,1]]
Output: 1
```

![ex1](/images/2021-10-02-distinct-islands-ex1.jpg)

```txt
Example 2:

Input: grid = [[1,1,0,1,1],[1,0,0,0,0],[0,0,0,0,1],[1,1,0,1,1]]
Output: 3
```

![ex2](/images/2021-10-02-distinct-islands-ex2.jpg)

Constraints:

- m == grid.length
- n == grid[i].length
- 1 <= m, n <= 50
- grid[i][j] is either 0 or 1.

## Set Solution

```java
class Solution {
    Set<Set<Pair<Integer, Integer>>> unique = new HashSet<>();
    public int numDistinctIslands(int[][] grid) {
        int count = 1;
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[0].length; j++) {
                if (grid[i][j] == 1) {
                    count++;
                    Set<Pair<Integer, Integer>> shape = new HashSet<>();
                    dfs(grid, i, j, shape, i, j, count);
                    unique.add(shape);
                }
            }
        }
        return unique.size();
    }
    
    int[][] DIRS = new int[][] {
        {1, 0},
        {-1, 0},
        {0, 1},
        {0, -1},
    };
    
    void dfs(int[][] grid, int i, int j, Set<Pair<Integer, Integer>> shape, int start, int end, int index) {
        grid[i][j] = index;
        
        shape.add(new Pair(i - start, j - end));
        
        for (int[] dir: DIRS) {
            int x = dir[0] + i;
            int y = dir[1] + j;
            
            if (x < 0 || x == grid.length || y < 0 || y == grid[0].length) continue;
            
            if (grid[x][y] == 1) {
                dfs(grid, x, y, shape, start, end, index);
            }
        }
    }
}
```

## Path Hash Solution

```java
class Solution {
    Set<String> unique = new HashSet<>();
    public int numDistinctIslands(int[][] grid) {
        int count = 1;
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[0].length; j++) {
                if (grid[i][j] == 1) {
                    count++;
                    StringBuilder sb = new StringBuilder();
                    dfs(grid, '0', i, j, sb, count);
                    unique.add(sb.toString());
                }
            }
        }
        return unique.size();
    }

    int[][] DIRS = new int[][] {
        {-1, 0}, // down 
        {0, 1}, // r
        {0, -1}, // l
        {1, 0}, // top
    };

    void dfs(int[][] grid, char direction, int i, int j, StringBuilder sb, int index) {
        if (i < 0 || i == grid.length || j < 0 || j == grid[0].length) return;
        if (grid[i][j] == 1) {
            grid[i][j] = index;
        
            sb.append(direction);

            dfs(grid, 'D', i + 1, j, sb, index);
            dfs(grid, 'T', i - 1, j, sb, index);
            dfs(grid, 'R', i, j + 1, sb, index);
            dfs(grid, 'L', i, j - 1, sb, index);
            sb.append('0');
        }
    }
}
```
