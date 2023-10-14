---
author: "volyx"
title:  "1514. Path with Maximum Probability"
date: "2021-04-07"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1514. Path with Maximum Probability](https://leetcode.com/problems/path-with-maximum-probability/)

You are given an undirected weighted graph of n nodes (0-indexed), represented by an edge list where edges[i] = [a, b] is an undirected edge connecting the nodes a and b with a probability of success of traversing that edge succProb[i].

Given two nodes start and end, find the path with the maximum probability of success to go from start to end and return its success probability.

If there is no path from start to end, return 0. Your answer will be accepted if it differs from the correct answer by at most 1e-5.

```txt
Example 1:

Input: n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.2], start = 0, end = 2
Output: 0.25000
Explanation: There are two paths from start to end, one having a probability of success = 0.2 and the other has 0.5 * 0.5 = 0.25.
```

![ex1](/images/2021-04-06-prob-ex1.png)

```txt
Example 2:

Input: n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.3], start = 0, end = 2
Output: 0.30000
```

![ex2](/images/2021-04-06-prob-ex2.png)

```txt
Example 3:

Input: n = 3, edges = [[0,1]], succProb = [0.5], start = 0, end = 2
Output: 0.00000
Explanation: There is no path between 0 and 2.
```

![ex3](/images/2021-04-06-prob-ex3.png)

Constraints:

- 2 <= n <= 10^4
- 0 <= start, end < n
- start != end
- 0 <= a, b < n
- a != b
- 0 <= succProb.length == edges.length <= 2*10^4
- 0 <= succProb[i] <= 1
- There is at most one edge between every two nodes.

## Solution

```java
class Solution {
    boolean[] visited = new boolean[10_0000];
    public boolean canReach(int[] arr, int start) {
        if (start < 0 || start >= arr.length) return false;
        if (visited[start]) return false;
        visited[start] = true;
        if (arr[start] == 0) return true;
        int right = start + arr[start];
        int left = start - arr[start];
        return canReach(arr, left) || canReach(arr, right);
    }
}
```
