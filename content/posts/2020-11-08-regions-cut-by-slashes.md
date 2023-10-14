---
author: "volyx"
title:  "Regions Cut By Slashes"
date: "2020-11-08"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dfs", "union-find"]
categories: ["leetcode"]
series: ["Union Find"]
aliases: ["regions-cut-by-slashes"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![959. Regions Cut By Slashes](https://leetcode.com/problems/regions-cut-by-slashes/)

An a N x N grid composed of 1 x 1 squares, each 1 x 1 square consists of a /, \, or blank space.  These characters divide the square into contiguous regions.

(Note that backslash characters are escaped, so a \ is represented as "\\".)

Return the number of regions.

Example 1:

```txt
Input:
[
  " /",
  "/ "
]
Output: 2
Explanation: The 2x2 grid is as follows:
```

![ex1](/images/2020-11-08-ex1.png)

Example 2:

```txt
Input:
[
  " /",
  "  "
]
Output: 1
Explanation: The 2x2 grid is as follows:
```

![ex2](/images/2020-11-08-ex2.png)

Example 3:

```txt
Input:
[
  "\\/",
  "/\\"
]
Output: 4
Explanation: (Recall that because \ characters are escaped, "\\/" refers to \/, and "/\\" refers to /\.)
```

The 2x2 grid is as follows:

![ex3](/images/2020-11-08-ex3.png)

Example 4:

```txt
Input:
[
  "/\\",
  "\\/"
]
Output: 5
Explanation: (Recall that because \ characters are escaped, "/\\" refers to /\, and "\\/" refers to \/.)
The 2x2 grid is as follows:
```

![ex4](/images/2020-11-08-ex4.png)

Example 5:

```txt
Input:
[
  "//",
  "/ "
]
Output: 3
Explanation: The 2x2 grid is as follows:
```

![ex5](/images/2020-11-08-ex5.png)

Note:

- 1 <= grid.length == grid[0].length <= 30
- grid[i][j] is either '/', '\', or ' '.

Solution:

```java
class Solution {
    public int regionsBySlashes(String[] input) {
        int N = input.length;
        int[][] matrix = new int[3 * N][3 * N];

        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                if (input[i].charAt(j) == '/') {
                    fillForwardSlash(matrix, i, j);
                } else if (input[i].charAt(j) == ' ') {

                } else {
                    fillBackwardSlash(matrix, i, j);
                }
            }
        }
        int count = 0;
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix.length; j++) {
                if (matrix[i][j] == 0) {
                    count++;
                    fill(matrix, i, j);
                }
            }
        }
        return count;
    }

    int[][] dirs = new int[][] {{1,0}, {0, 1}, {-1, 0}, {0, -1}};

    void fill(int[][] matrix, int i, int j) {
        if (i < 0 || i == matrix.length || j < 0 || j == matrix.length || matrix[i][j] == 1) return;

        matrix[i][j] = 1;

        for(var dir : dirs) {
            fill(matrix, i + dir[0], j + dir[1]);
        }
    }

    void fillForwardSlash(int[][] m, int row, int col) {
        m[3 * row + 2][3 * col] = 1;
        m[3 * row + 1][3 * col + 1] = 1;
        m[3 * row][3 * col + 2] = 1;
    }

    void fillBackwardSlash(int[][] m, int row, int col) {
        m[3 * row][3 * col] = 1;
        m[3 * row + 1][3 * col + 1] = 1;
        m[3 * row + 2][3 * col + 2] = 1;
    }
}
```

## Solution 2022-01-13

```java
class Solution {
    public int regionsBySlashes(String[] grid) {
        int n = grid.length;
        int m = grid[0].length();
        
        int n3 = n * 3;
        int m3 = m * 3;
        
        int[][] G = new int[n3][m3];
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                char c = grid[i].charAt(j);
                if (c == '/') {
                    fillForward(i * 3, j * 3, G);         
                } else if (c == '\\') {
                    fillBackward(i * 3, j * 3, G);
                }
            }
        }
                           
        int count = 0;
        for (int i = 0; i < n3; i++) {
            for (int j = 0; j < m3; j++) {
                if (G[i][j] == 0) {
                    dfs(i, j, G);
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
    void dfs(int i, int j, int[][] g) {
       if (i < 0 || i >= g.length || j < 0 || j >= g[0].length) {
           return;
       }
        
       if (g[i][j] == 1) {
           return;
       } 
        
       g[i][j] = 1;
        
        for (int[] dir: DIRS) {
            dfs(i + dir[0], j + dir[1], g);
        }
    }
                           
    void fillForward(int i, int j, int[][] g) {

        
        g[i][j + 2] = 1;
        g[i + 1][j + 1] = 1;
        g[i + 2][j] = 1;
    }
                           
    void fillBackward(int i, int j, int[][] g) {
        g[i][j] = 1;
        g[i + 1][j + 1] = 1;
        g[i + 2][j + 2] = 1;
    }
}
```

# Solution 2023-02-18 - UnionFind

```
class Solution {
    public int regionsBySlashes(String[] grid) {
        int n = grid[0].length();
        int[][] array = new int[3 * n][3 * n];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                char c = grid[i].charAt(j);

                if (c == '/') {
                    fillForward(array, 3*i, 3*j);
                } else if (c == '\\') {
                    fillBackward(array, 3*i, 3*j);
                }
            }
        }

        // print(array);

        UF uf = new UF(9 * n * n);

        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array.length; j++) {
                  
                  if (array[i][j] == 0) {
                    // right
                    if (j < array.length - 1 && array[i][j + 1] == 0) {
                        uf.union(array.length * i + j, array.length * i + j + 1);
                    }
                    // down
                    if (i < array.length - 1 && array[i+1][j] == 0) {
                        uf.union(array.length * i + j, array.length * (i+1) + j);
                    }
                  }       
            }
        }

        Set<Integer> provinces = new HashSet<>();

        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array.length; j++) {
                int index = array.length * i + j;
                int pid = uf.parent(index);
                if (index != uf.parent(index)) {
                    provinces.add(pid);
                }
            }
        }

        return provinces.size();
    }


    class UF {
        int[] a;
        int[] sizes;

        UF(int n) {
            this.a = new int[n];
            this.sizes = new int[n];
            for (int i = 0; i < a.length; i++) {
                a[i] = i;
            }
        }

        void union(int p, int q) {

            int pid = parent(p);
            int qid = parent(q);

            if (pid == qid) return;

            if (sizes[pid] < sizes[qid]) {
                a[qid] = a[pid];
            } else {
                a[pid] = a[qid];    
            }
        }

        int parent(int p) {
            while (a[p] != p) {
                p = a[p];
            }
            return p;
        }
    }

    void print(int[][] a) {
        int n = a.length;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                System.out.printf("%d ", a[i][j]);
            }
            System.out.println();
        } 
    }

    void fillForward(int[][] a, int i, int j) {
        a[i][j] = 0;
        a[i][j+1] = 0;
        a[i][j+2] = 1;

        a[i+1][j] = 0;
        a[i+1][j+1] = 1;
        a[i+1][j+2] = 0;

        a[i+2][j] = 1;
        a[i+2][j+1] = 0;
        a[i+2][j+2] = 0;
 
    }

     void fillBackward(int[][] a, int i, int j) {
        a[i][j] = 1;
        a[i][j+1] = 0;
        a[i][j+2] = 0;

        a[i+1][j] = 0;
        a[i+1][j+1] = 1;
        a[i+1][j+2] = 0;

        a[i+2][j] = 0;
        a[i+2][j+1] = 0;
        a[i+2][j+2] = 1;
 
    }
}
```

