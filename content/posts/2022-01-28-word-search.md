---
author: "volyx"
title: "79. Word Search"
date: "2022-01-28"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dfs", "backtracking"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1937. Maximum Number of Points with Cost](https://leetcode.com/problems/word-search/)

Given an m x n grid of characters board and a string word, return true if word exists in the grid.

The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

![ex1](/images/2022-01-28-word-search-ex1.jpg)

```txt
Example 1:

Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
Output: true
```

![ex2](/images/2022-01-28-word-search-ex2.jpg)

```txt
Example 2:

Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
Output: true
```

```txt
Example 3:

Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
Output: false
```

Constraints:

- m == board.length
- n = board[i].length
- 1 <= m, n <= 6
- 1 <= word.length <= 15
- board and word consists of only lowercase and uppercase English letters.

Follow up: Could you use search pruning to make your solution faster with a larger board?

Constraints:

- The number of nodes in the tree is in the range [0, 2000].
- -1000 <= Node.val <= 1000
- All the values of the tree are unique.

[Time Complexity](https://cs.stackexchange.com/questions/96626/whats-the-big-o-runtime-of-a-dfs-word-search-through-a-matrix )

![tc](/images/2022-01-28-word-search-tc.png)

## Solution

```java
class Solution {
    public boolean exist(char[][] board, String word) {
        int n = board.length;
        int m = board[0].length;
        int[][] visited = new int[n][m];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (dfs(0, word, board, i, j, visited)) {
                    return true;
                }
            }
        }
        return false;
    }
    
    int[][] DIRS = new int[][] {
        {1, 0},
        {-1, 0},
        {0, 1},
        {0, -1},
    };
        
    boolean dfs(int index, String word, char[][] board, int i, int j, int[][] visited) {
        
        if (index == word.length()) {
            return true;
        }
    
        int n = board.length;
        int m = board[0].length;

        if (i == -1 || i == n || j == -1 || j == m || visited[i][j] == 1 
            || word.charAt(index) != board[i][j]) {
            return false;
        }

        visited[i][j] = 1;

        for (int[] dir: DIRS) {
            if (dfs(index + 1, word, board, i + dir[0], j + dir[1], visited)) {
                return true;
            }
           
        }
        visited[i][j] = 0;
        return false;
    }
}
```
