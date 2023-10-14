---
author: "volyx"
title:  "210. Course Schedule II"
date: "2021-03-30"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "graph", "topological"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[210. Course Schedule II](https://leetcode.com/problems/course-schedule-ii/)

There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.

Return true if you can finish all courses. Otherwise, return false.

```txt
Example 1:

Input: numCourses = 2, prerequisites = [[1,0]]
Output: true
Explanation: There are a total of 2 courses to take. 
To take course 1 you should have finished course 0. So it is possible.
```

```txt
Example 2:

Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
Output: false
Explanation: There are a total of 2 courses to take. 
To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.
```

Constraints:

- 1 <= numCourses <= 105
- 0 <= prerequisites.length <= 5000
- prerequisites[i].length == 2
- 0 <= ai, bi < numCourses
- All the pairs prerequisites[i] are unique.

## Jamboard

![j1](/images/207_Course_Schedule_5.png)

## Solution

```java
class Solution {
    int[] ans;
    int n = 0;
    int[][] g;
    int[] visited;
    boolean cycle;
    public int[] findOrder(int numCourses, int[][] prerequisites) {
        n = numCourses;
        ans = new int[numCourses];
        visited = new int[numCourses];
        g = prerequisites;
        for (int i = 0; i < numCourses; i++) {
            if (visited[i] == 0) {
                dfs(i);
                if (cycle) break;
            }
        }
        return cycle ? new int[0] : ans;
    }
    
    void dfs(int s) {
        visited[s] = 1;
        for (int[] course: g) {
            if (course[1] == s) {
                int e = course[0];
                if (visited[e] == 0) {
                    dfs(e);
                    if (cycle) break;
                } else if (visited[e] != 2) {
                    cycle = true;
                    break;
                }
            }
        }
        if (cycle) return;
        visited[s] = 2;
        ans[--n] = s;
    }
}
```

## Solution 2021-11-23

```java
class Solution {
    int[] res;
    int size;
    public int[] findOrder(int numCourses, int[][] prerequisites) {
        int n = numCourses;
        Map<Integer, List<Integer>> g = buildGraph(n, prerequisites);
        res = new int[n];
        size = n - 1;
        int[] visited = new int[n];
        for (int i = 0; i < n; i++) {
            if (visited[i] == 0) {
                boolean hasCycle = dfs(i, visited, g, res);
                if (hasCycle) {
                    return new int[0];
                }
            }
        }
        return res;
    }
    
    boolean dfs(int index, int[] visited, Map<Integer, List<Integer>> g, int[] res) {
        visited[index] = 1; 
        for (int nei: g.get(index)) {
            if (visited[nei] == 0) {
                 if (dfs(nei, visited, g, res)) {
                     return true;
                 }
            } else if (visited[nei] == 1){
                return true;
            }
        }
        visited[index] = 2;
        res[size--] = index;
        return false;
    }
    
    Map<Integer, List<Integer>> buildGraph(int n, int[][] prerequisites) {
        Map<Integer, List<Integer>> g = new HashMap<>();
        for (int i = 0; i < n; i++) {
            g.put(i, new ArrayList<>());
        }
        for (int[] prer: prerequisites) {
            g.get(prer[1]).add(prer[0]);
        }
        return g;
    }
}
```
