---
author: "volyx"
title:  "1168. Optimize Water Distribution in a Village"
date: "2021-08-01"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "graph", "spanning-tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1168. Optimize Water Distribution in a Village](https://leetcode.com/problems/shuffle-string/)

There are n houses in a village. We want to supply water for all the houses by building wells and laying pipes.

For each house i, we can either build a well inside it directly with cost wells[i - 1] (note the -1 due to 0-indexing), or pipe in water from another well to it. The costs to lay pipes between houses are given by the array pipes, where each pipes[j] = [house1j, house2j, costj] represents the cost to connect house1j and house2j together using a pipe. Connections are bidirectional.

Return the minimum total cost to supply water to all houses.

```txt
Example 1:

Input: n = 3, wells = [1,2,2], pipes = [[1,2,1],[2,3,1]]
Output: 3
Explanation: 
The image shows the costs of connecting houses using pipes.
The best strategy is to build a well in the first house with cost 1 and connect the other houses to it with cost 2 so the total cost is 3.
```

![ex1](/images/2021-08-01-ex1.png)

Constraints:

- 1 <= n <= 104
- wells.length == n
- 0 <= wells[i] <= 105
- 1 <= pipes.length <= 104
- pipes[j].length == 3
- 1 <= house1j, house2j <= n
- 0 <= costj <= 105
- house1j != house2j

## Solution

```java
class Solution {

    public int minCostToSupplyWater(int n, int[] wells, int[][] pipes) {
        
        List<List<Integer>> edgeList = new ArrayList<>();
        for (int i = 0; i < pipes.length; i++) {
            int[] pipe = pipes[i];
            int from = pipe[0];
            int to = pipe[1];
            edgeList.add(Arrays.asList(from, to, pipe[2]));
            edgeList.add(Arrays.asList(to, from, pipe[2]));
            
        }
        
        for (int i = 0; i < n; i++) {
            edgeList.add(Arrays.asList(0, i + 1, wells[i]));
            edgeList.add(Arrays.asList(i + 1, 0, wells[i]));
        }
        
        PriorityQueue<List<Integer>> queue = new PriorityQueue<List<Integer>>((a, b) -> {
            return a.get(2) - b.get(2);
        });
        
        for (List<Integer> edge: edgeList) {
            queue.add(edge);
        }
        
        int cost = 0;
        UF uf = new UF(100_000);
        while (queue.size() > 0) {
            List<Integer> edge = queue.poll();
            
            int from = edge.get(0);
            int to = edge.get(1);
            
            if (!uf.isConnected(from, to)) {
                uf.connect(from, to);
                cost += edge.get(2);
            }
        }
        return cost;
    }
    
    class UF {
        int n;
        int[] a;
        int[] sizes;
        
        public UF(int n) {
            this.a = new int[n];
            this.n = n;
            this.sizes = new int[n];
            
            for (int i = 0; i < n; i++) {
                a[i] = i;
            }
        }
        
        void connect(int p, int q) {
            int pid = parent(p);
            int qid = parent(q);
            
            if (sizes[pid] > sizes[qid]) {
                a[qid] = pid;
                sizes[pid] += sizes[qid];
            } else {
                a[pid] = qid;
                sizes[qid] += sizes[pid];
            }
        }
        
        boolean isConnected(int i, int j) {
            return parent(i) == parent(j);
        }
        
        int parent(int i) {
            while (i != a[i]) {
                i = a[i];
            }
            return i;
        }
    }
}
```
