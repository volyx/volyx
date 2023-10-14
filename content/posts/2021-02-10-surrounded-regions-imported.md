---
author: "volyx"
title:  "130. Surrounded Regions"
date: "2021-02-10"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium","union-find"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---



![https://leetcode.com/problems/surrounded-regions/]

Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.

A region is captured by flipping all 'O's into 'X's in that surrounded region.

```txt
Example:

X X X X
X O O X
X X O X
X O X X

After running your function, the board should be:

X X X X
X X X X
X X X X
X O X X
```

Explanation:

Surrounded regions shouldn’t be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.

```java
class Solution {
    int[][] DIRECTIONS = new int[][] {
        {1, 0},
        {-1, 0},
        {0, -1},
        {0, 1}
    };
    /*
    [
    ["X","O","X","O","X","O"],
    ["O","X","O","X","O","X"],
    ["X","O","X","O","X","O"],
    ["O","X","O","X","O","X"]
    
    ]
    
    [
    ["O","X","X","O","X"],
    ["X","O","O","X","O"],
    ["X","O","X","O","X"],
    ["O","X","O","O","O"],
    ["X","X","O","X","O"]
    ]
    
    [
    ["X","O","X","X"],
    ["O","X","O","X"],
    ["X","O","X","O"],
    ["O","X","O","X"],
    ["X","O","X","O"],
    ["O","X","O","X"]
    ]
    
    */
    int n,m;
    public void solve(char[][] board) {
        n = board.length;
        
        if (n == 0) {
            return;
        }
        
        m = board[0].length;
        UF uf = new UF(n * m);
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (board[i][j] == 'O') {
                    for (int[] dir: DIRECTIONS) {
                        int row = dir[0] + i;
                        int col = dir[1] + j;
                        if (row >= 0 && row < n && col >= 0 && col < m 
                            && board[row][col] == 'O') {
                            uf.union(getIndex(i, j), getIndex(row, col));
                            // System.out.printf("union %d,%d and %d,%d %n", i, j, row, col);
                        }
                    }
                }
            }
        }
        
        Set<Integer> remains = new HashSet<>();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (board[i][j] == 'O' && 
                    // is boarder
                    (i == 0 || i == n - 1 || j == 0 || j == m - 1)) {
                    remains.add(uf.find(getIndex(i, j)));
                }  
            }
        }
        
        // System.out.println(remains);
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (board[i][j] == 'O' && !remains.contains(uf.find(getIndex(i, j)))) {
                    board[i][j] = 'X';
                }
            }
        }                
    }
    
    int getIndex(int i , int j) {
        int index = i * m + j;
        // System.out.printf("%d, %d to index %d %n", i, j, index);
        return index;
    }
    
    static class UF {
        
        int[] a;
        int[] sz;
        
        public UF(int n) {
            this.a = new int[n];
            this.sz = new int[n];
            
            for (int i = 0; i < n; i++) {
                this.a[i] = i;
                this.sz[i] = 1;
            }
        }
        
        int find(int p) {
            while (p != a[p]) {
                p = a[p];
            }
            return p;
        }
        
        void union(int p, int q) {
            int parentP = find(p);
            int parentQ = find(q);
            if (sz[parentP] > sz[parentQ]) {
                a[parentQ] = parentP;
                sz[parentP] += sz[parentQ]; 
            } else {
                a[parentP] = parentQ;
                sz[parentQ] += sz[parentP]; 
            }
        }
    }
}
