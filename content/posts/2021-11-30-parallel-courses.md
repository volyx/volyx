---
author: "volyx"
title:  "1136. Parallel Courses"
date: "2021-11-30"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dfs", "graph", "bfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1136. Parallel Courses](https://leetcode.com/problems/parallel-courses/)

You are given an integer n, which indicates that there are n courses labeled from 1 to n. You are also given an array relations where relations[i] = [prevCoursei, nextCoursei], representing a prerequisite relationship between course prevCoursei and course nextCoursei: course prevCoursei has to be taken before course nextCoursei.

In one semester, you can take any number of courses as long as you have taken all the prerequisites in the previous semester for the courses you are taking.

Return the minimum number of semesters needed to take all courses. If there is no way to take all the courses, return -1.

![ex1](/images/2021-11-30-parallelcourses-ex1.jpg)

```txt
Example 1:

Input: n = 3, relations = [[1,3],[2,3]]
Output: 2
Explanation: The figure above represents the given graph.
In the first semester, you can take courses 1 and 2.
In the second semester, you can take course 3.
```

![ex2](/images/2021-11-30-parallelcourses-ex2.jpg)

```txt
Example 2:

Input: n = 3, relations = [[1,2],[2,3],[3,1]]
Output: -1
Explanation: No course can be studied because they are prerequisites of each other.
```

Constraints:

- 1 <= n <= 5000
- 1 <= relations.length <= 5000
- relations[i].length == 2
- 1 <= prevCourse_i, nextCourse_i <= n
- prevCoursei != nextCoursei
- All the pairs [prevCoursei, nextCoursei] are unique.

## Solution BFS (cut inDegree edges)

```java
class Solution {
    public int minimumSemesters(int n, int[][] relations) {
        List<List<Integer>> graph = new ArrayList<>();
        
        for (int i = 0; i < n + 1; i++) {
            graph.add(new ArrayList<>());
        }
        
        int[] inDegree = new int[n + 1];
        for (int[] rel: relations) {
            int from = rel[0];
            int to = rel[1];
            graph.get(from).add(to);
            inDegree[to]++;
        }
        
        List<Integer> q = new ArrayList<>();
        for (int i = 1; i < n + 1; i++) {
            if (inDegree[i] == 0) {
                q.add(i);
            }
        }
        
        int step = 0;
        int studiedCount = 0;
        while (q.size() > 0) {
            step++;
            
            List<Integer> nextQ = new ArrayList<>();
            
            for (int node: q) {
                studiedCount++;
                for (int end : graph.get(node)) {
                    inDegree[end]--;
                    if (inDegree[end] == 0) {
                        nextQ.add(end);
                    }
                }
                q = nextQ;
            }
        }
        return studiedCount == n? step: -1;
    }
}
```

## Solution DFS + Cycle Detection

```java
class Solution {
    public int minimumSemesters(int n, int[][] relations) {
        List<List<Integer>> graph = new ArrayList<>();
        
        for (int i = 0; i < n + 1; i++) {
            graph.add(new ArrayList<>());
        }
        for (int[] rel: relations) {
            graph.get(rel[0]).add(rel[1]);
        }
        
        int[] visited = new int[n + 1];
        int maxLength = 1;
        for (int node = 1; node < n + 1; node++) {
            int length = dfs(node, graph, visited);
            if (length == -1) return -1;    
             maxLength = Math.max(length, maxLength);
        }
        return maxLength;
    }
    
    int dfs(int node, List<List<Integer>> graph, int[] visited) {
        if (visited[node] != 0) {
            return visited[node];
        }
        
        visited[node] = -1;
        
        int maxLength = 1;
        
        for (int end: graph.get(node)) {
            int length = dfs(end, graph, visited);
            if (length == -1) return -1;
            maxLength = Math.max(length + 1, maxLength);
        }
        visited[node] = maxLength;
        return maxLength;
    }
}
```
