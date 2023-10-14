---
author: "volyx"
title:  "Find the Town Judge"
date: "2020-05-29"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

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

## Solution

```java
class Solution {
    public int findJudge(int N, int[][] trust) {
        int[] count = new int[N + 1];
        for (int i = 0; i < trust.length; i++) {
            count[trust[i][1]]++;
            count[trust[i][0]]--;
        }
        for (int i = 1; i < N + 1; i++) {
            if (count[i] == N - 1) {
                return i;
            }
        }
        return -1;
    }
}
```

## Solution 2021-01-03

```java
class Solution {
    public int findJudge(int n, int[][] trust) {
        int[] in = new int[n + 1];
        int[] out = new int[n + 1];
        
        for (int[] tr: trust) {
            in[tr[1]]++;
            out[tr[0]]++;
        }
        // in [0, 0, 1]
        // out[0, 1, 0]
        for (int i = 1; i < in.length; i++) {
            if (in[i] == n - 1 && out[i] == 0) {
                return i;
            }
        }
        return -1;
    }
}
```
