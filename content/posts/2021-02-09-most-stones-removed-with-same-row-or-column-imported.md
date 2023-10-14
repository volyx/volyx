---
author: "volyx"
title:  "947. Most Stones Removed with Same Row or Column"
date: "2021-02-09"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium","union-find"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/]

On a 2D plane, we place n stones at some integer coordinate points. Each coordinate point may have at most one stone.

A stone can be removed if it shares either the same row or the same column as another stone that has not been removed.

Given an array stones of length n where stones[i] = [xi, yi] represents the location of the ith stone, return the largest possible number of stones that can be removed.

```txt
Example 1:

Input: stones = [[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]
Output: 5
Explanation: One way to remove 5 stones is as follows:
1. Remove stone [2,2] because it shares the same row as [2,1].
2. Remove stone [2,1] because it shares the same column as [0,1].
3. Remove stone [1,2] because it shares the same row as [1,0].
4. Remove stone [1,0] because it shares the same column as [0,0].
5. Remove stone [0,1] because it shares the same row as [0,0].
Stone [0,0] cannot be removed since it does not share a row/column with another stone still on the plane.

Example 2:

Input: stones = [[0,0],[0,2],[1,1],[2,0],[2,2]]
Output: 3
Explanation: One way to make 3 moves is as follows:
1. Remove stone [2,2] because it shares the same row as [2,0].
2. Remove stone [2,0] because it shares the same column as [0,0].
3. Remove stone [0,2] because it shares the same row as [0,0].
Stones [0,0] and [1,1] cannot be removed since they do not share a row/column with another stone still on the plane.

Example 3:

Input: stones = [[0,0]]
Output: 0
Explanation: [0,0] is the only stone on the plane, so you cannot remove it.
```

Constraints:

- 1 <= stones.length <= 1000
- 0 <= xi, yi <= 104
- No two stones are at the same coordinate point.

```java
/**

[[3,2],[3,1],[4,4],[1,1],[0,2],[4,0]]
x x 4 x x 
x 3 x x x
x x x x x
x 1 0 x x
5 x x x 2

[[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]

0 1 x
2 x 3
x 4 5 

0 r x
r x r
x r r

[[0,1],[1,0]]

* 0
1 *

[[3,2],[3,1],[4,4],[1,1],[0,2],[4,0]]

* * 4 * *
* 3 * * *
* * * * *
* 1 0 * *
5 * * * 2

**/
class Solution {
    int n;
    public int removeStones(int[][] stones) {
        
        n = 0;
        for (int i = 0; i < stones.length; i++) {
            n = Math.max(n, stones[i][0]);
            n = Math.max(n, stones[i][1]);
        }
        n = n + 1;
        UF uf = new UF(n + n);
        for (int[] stone: stones) {
             uf.union(stone[0], n + stone[1]);
        }
        
        Map<Integer, Integer> counts = new HashMap();
        for (int[] stone: stones) {
            int id = uf.find(stone[0]);
            int componentSize = counts.getOrDefault(id, 0);
            counts.put(id, componentSize + 1);
        }
        
        Integer maxComponentSize = 0;
        for (Map.Entry<Integer, Integer> keyValue: counts.entrySet()) {
            if (keyValue.getValue() > 1) {
                 maxComponentSize += keyValue.getValue() - 1;
            }
        }
        
        return maxComponentSize;
    }

    class UF {
        
        private int n;
        private int[] a;
        private int[] sz;
        
        public UF(int n) {
            this.n = n;
            this.a = new int[n];
            this.sz = new int[n];
            
            for (int i = 0; i < n; i++) {
                a[i] = i;
                sz[i] = 1;
            }
        }
        
        void union(int p, int q) {
            int pid = find(p);
            int qid = find(q);
            
            if (pid == qid) return;
            
            if (sz[pid] >= sz[qid]) {
                a[qid] = a[pid];
                sz[pid] += sz[qid];
            } else {
                a[pid] = qid;
                sz[qid] += sz[pid];
            }
        }
        
        int find(int p) {
            while(p != a[p]) {
                p = a[p];
            }
            return p;
        }
    }
}
