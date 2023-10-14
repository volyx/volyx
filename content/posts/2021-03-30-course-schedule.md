---
author: "volyx"
title:  "207. Course Schedule"
date: "2021-03-30"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "graph", "topological", "dfs", "kosaraju"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[207. Course Schedule](https://leetcode.com/problems/course-schedule/)

There are a total of n courses you have to take labelled from 0 to n - 1.

Some courses may have prerequisites, for example, if prerequisites[i] = [ai, bi] this means you must take the course bi before the course ai.

Given the total number of courses numCourses and a list of the prerequisite pairs, return the ordering of courses you should take to finish all courses.

If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.

```txt
Example 1:

Input: numCourses = 2, prerequisites = [[1,0]]
Output: [0,1]
Explanation: There are a total of 2 courses to take. To take course 1 you should have finished course 0. So the correct course order is [0,1].
```

```txt
Example 2:

Input: numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]
Output: [0,2,1,3]
Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3].
```

```txt
Example 3:

Input: numCourses = 1, prerequisites = []
Output: [0]
```

Constraints:

- 1 <= numCourses <= 2000
- 0 <= prerequisites.length <= numCourses * (numCourses - 1)
- prerequisites[i].length == 2
- 0 <= ai, bi < numCourses
- ai != bi
- All the pairs [ai, bi] are distinct.

## Jamboard

![j1](/images/207_Course_Schedule_1.png)

![j2](/images/207_Course_Schedule_2.png)

![j3](/images/207_Course_Schedule_3.png)

![j4](/images/207_Course_Schedule_4.png)

## Solution

```java
class Solution {
  int[] q = new int[5_000];
  int head = 0;
  int tail = 0;  
  public boolean canFinish(int n, int[][] prerequisites) {
        boolean[] visited = new boolean[n];
        List<List<Integer>> G = new ArrayList<>();
        int[] indegree = new int[n];
        for (int i = 0; i < n; i++) {
            G.add(new ArrayList<>());
        }
        for (int i = 0; i < prerequisites.length; i++) {
            int[] course = prerequisites[i];
            G.get(course[1]).add(course[0]);
            indegree[course[0]]++;
        }
        for (int i = 0; i < n; i++) {
            if (indegree[i] == 0) q[tail++] = i;
        }
        int count = 0;
        while (head != tail) {
            int v = q[head++];
            
            for (Integer e: G.get(v)) {
                indegree[e]--;
                if (indegree[e] == 0) q[tail++] = e;
            }
            count++;
        }
        return count == n;
    }
    
    
    // 0/1/2 unprocessed, processing, processed
    int[] visited;
    int[][] g;
    public boolean canFinish2(int n, int[][] prerequisites) {
        visited = new int[n];
        g = prerequisites;
        
        for (int i = 0; i < n; i++) {
            if (visited[i] == 0) {
                boolean cycle = dfs(i);
                if (cycle) return false;
            }
        }
        return true;
    }
    
    boolean dfs(int s) {
        visited[s] = 1;
        for (int i = 0;  i < g.length; i++) {
            int[] course = g[i];
            if (course[1] == s) {
                int v = course[0];
                if (visited[v] == 0)  {
                    boolean cycle = dfs(v);
                    if (cycle) return true;
                } else if (visited[v] != 2) {
                    return true;
                }
            }
        }
        visited[s] = 2;
        return false;
    }
}
```

## Solution - Kosaraju Algorithm

```java
class Solution {
    int[] visited;
    int[] who;
    Stack<Integer> st = new Stack<>();
    List<Integer>[] G;
    List<Integer>[] revG;
    int count = 0;
    public boolean canFinish(int numCourses, int[][] prerequisites) {
        visited = new int[numCourses];
        who = new int[numCourses];
        G =  new List[numCourses];
        revG =  new List[numCourses];
        
        for (int i = 0; i < numCourses; i++) {
             G[i] = new ArrayList<>();
             revG[i] = new ArrayList<>();
        }
        
        for (int[] pr: prerequisites) {
            int before = pr[0];
            int after = pr[1];
            G[before].add(after);
            revG[after].add(before);
        }
        
        for (int i = 0; i < numCourses; i++) {
            if (visited[i] == 0) {
                dfs(i);
            }
        }
        
        Arrays.fill(visited, 0);
        
        while (st.size() > 0) {
            int n = st.pop();
            if (visited[n] == 0) {
                count++;
                dfs1(n, n);
            }        
        }
        
        System.out.println(Arrays.toString(who));
        
        return numCourses == count;
    }
    
    void dfs(int i) {
        visited[i] = 1;
        for (int u: G[i]) {
            if (visited[u] == 0) {
                dfs(u);
            }
        }
        st.push(i);
    }
    
    void dfs1(int i, int rep) {
        visited[i] = 1;
        who[i] = rep;
        for (int u: revG[i]) {
            if (visited[u] == 0) {
                dfs1(u, rep);
            }
        }
    }
}
```

