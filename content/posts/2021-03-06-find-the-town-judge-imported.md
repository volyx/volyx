---
author: "volyx"
title:  "997. Find the Town Judge"
date: "2021-03-06"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "graph"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/find-the-town-judge/]

In a town, there are N people labelled from 1 to N.  There is a rumor that one of these people is secretly the town judge.

If the town judge exists, then:

- The town judge trusts nobody.
- Everybody (except for the town judge) trusts the town judge.
- There is exactly one person that satisfies properties 1 and 2.

You are given trust, an array of pairs trust[i] = [a, b] representing that the person labelled a trusts the person labelled b.

If the town judge exists and can be identified, return the label of the town judge.  Otherwise, return -1.

```txt
Example 1:

Input: N = 2, trust = [[1,2]]
Output: 2

Example 2:

Input: N = 3, trust = [[1,3],[2,3]]
Output: 3

Example 3:

Input: N = 3, trust = [[1,3],[2,3],[3,1]]
Output: -1

Example 4:

Input: N = 3, trust = [[1,2],[2,3]]
Output: -1

Example 5:

Input: N = 4, trust = [[1,3],[1,4],[2,3],[2,4],[4,3]]
Output: 3
```

Constraints:

- 1 <= N <= 1000
- 0 <= trust.length <= 10^4
- trust[i].length == 2
- trust[i] are all different
- trust[i][0] != trust[i][1]
- 1 <= trust[i][0], trust[i][1] <= N

```java
class Solution {
    public int findJudge(int N, int[][] trust) {
        int[] in = new int[N + 1];
       
        for (int[] edge: trust) {
            int from = edge[0];
            int to = edge[1];
            in[to]++;
            in[from]--;            
        }
        
        for (int i = 1; i < N + 1; i++) {
            if (in[i] == N - 1) {
                return i;
            }   
        }
        
        return -1;
    }
}
