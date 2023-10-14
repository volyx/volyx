---
author: "volyx"
title:  "351. Android Unlock Patterns"
date: "2021-11-09"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![351. Android Unlock Patterns](https://leetcode.com/problems/android-unlock-patterns/)

Android devices have a special lock screen with a 3 x 3 grid of dots. Users can set an "unlock pattern" by connecting the dots in a specific sequence, forming a series of joined line segments where each segment's endpoints are two consecutive dots in the sequence. A sequence of k dots is a valid unlock pattern if both of the following are true:

- All the dots in the sequence are distinct.
- If the line segment connecting two consecutive dots in the sequence passes through the center of any other dot, the other dot must have previously appeared in the sequence. No jumps through the center non-selected dots are allowed.
- For example, connecting dots 2 and 9 without dots 5 or 6 appearing beforehand is valid because the line from dot 2 to dot 9 does not pass through the center of either dot 5 or 6.
- However, connecting dots 1 and 3 without dot 2 appearing beforehand is invalid because the line from dot 1 to dot 3 passes through the center of dot 2.

![ex1](/images/2021-11-09-andoid-lock-ex1.png)

Here are some example valid and invalid unlock patterns:

- The 1st pattern [4,1,3,6] is invalid because the line connecting dots 1 and 3 pass through dot 2, but dot 2 did not previously appear in the sequence.
- The 2nd pattern [4,1,9,2] is invalid because the line connecting dots 1 and 9 pass through dot 5, but dot 5 did not previously appear in the sequence.
- The 3rd pattern [2,4,1,3,6] is valid because it follows the conditions. The line connecting dots 1 and 3 meets the condition because dot 2 previously appeared in the sequence.
- The 4th pattern [6,5,4,1,9,2] is valid because it follows the conditions. The line connecting dots 1 and 9 meets the condition because dot 5 previously appeared in the sequence.

Given two integers m and n, return the number of unique and valid unlock patterns of the Android grid lock screen that consist of at least m keys and at most n keys.

Two unlock patterns are considered unique if there is a dot in one sequence that is not in the other, or the order of the dots is different.

```txt
Example 1:

Input: m = 1, n = 1
Output: 9
```

```txt
Example 2:

Input: m = 1, n = 2
Output: 65
```

Constraints:

- 1 <= m, n <= 9

## Solution

```java
class Solution {
    public int numberOfPatterns(int m, int n) {
        int[][] visited = new int[3][3];
        Set<String> set = new HashSet<>();
        List<Integer> path = new ArrayList<>();
        int count = 0;
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (visited[i][j] == 0) {
                    dfs(i, j, visited, path, m, n, set);
                    visited[i][j] = 0;
                    count += set.size();
                    set.clear();
                    path.clear();
                }
            }
        }
        
        return count;
    }
    
    void dfs(int i, int j, int[][] visited, List<Integer> path, int m, int n, Set<String> set) {       
        
        visited[i][j] = 1;
        
        // print(visited);
        
        path.add(i * 3 + j + 1);
        
        if (m <= path.size() && path.size() <= n) {
            set.add(path.toString());
        }
        
        if (path.size() > n) return;
        
        for (int row = 0; row < 3; row++) {
            for (int col = 0; col < 3; col++) {
                if (isReachable(i, j, row, col, visited)) {
                    dfs(row, col, visited, path, m, n, set);
                    visited[row][col] = 0;
                    Integer prev = path.remove(path.size() - 1);
                }
            }
        }
    }
    
    
    boolean isReachable(int i, int j, int row, int col, int[][] visited) {
        if (visited[row][col] == 1) return false; 
        
        if (Math.abs(i - row) == 1 || Math.abs(j - col) == 1) {
            return true;
        }
        
        if (Math.abs(i - row) == 2 && Math.abs(j - col) == 2) {
            return visited[1][1] == 1;
        }
        
        if (Math.abs(i - row) == 2) {
            return visited[1][j] == 1;
        }
        
        if (Math.abs(j - col) == 2) {
            return visited[i][1] == 1;
        }
        
        return false;
    }
    
    void print(int[][] visited) {
        for (int[] vis: visited) {
            System.out.println(Arrays.toString(vis));
        }
        System.out.println();
    }
    
}
 ```

## Solution 2

```java
class Solution {
    int count = 0;
    public int numberOfPatterns(int m, int n) {
        int[][] visited = new int[3][3];
        
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (visited[i][j] == 0) {
                    dfs(i, j, 1, visited, m, n);
                }
            }
        }
        
        return count;
    }
    
    void dfs(int i, int j, int pathSize, int[][] visited, int m, int n) {       
        
        visited[i][j] = 1;
        
        if (m <= pathSize && pathSize <= n) {
            count++;
        } else if (pathSize > n) {
            return;
        }
        
        for (int row = 0; row < 3; row++) {
            for (int col = 0; col < 3; col++) {
                if (isReachable(i, j, row, col, visited)) {
                    dfs(row, col, pathSize + 1, visited, m, n);
                    visited[row][col] = 0;
                }
            }
        }
        
        visited[i][j] = 0;
    }
    
    
    boolean isReachable(int i, int j, int row, int col, int[][] visited) {
        if (visited[row][col] == 1) return false; 
        
        if (Math.abs(i - row) == 1 || Math.abs(j - col) == 1) {
            return true;
        }
        
        if (Math.abs(i - row) == 2 && Math.abs(j - col) == 2) {
            return visited[1][1] == 1;
        }
        
        if (Math.abs(i - row) == 2) {
            return visited[1][j] == 1;
        }
        
        if (Math.abs(j - col) == 2) {
            return visited[i][1] == 1;
        }
        
        return false;
    }
    
    void print(int[][] visited) {
        for (int[] vis: visited) {
            System.out.println(Arrays.toString(vis));
        }
        System.out.println();
    }
    
}
```