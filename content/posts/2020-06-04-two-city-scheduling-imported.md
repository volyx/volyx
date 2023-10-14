---
author: "volyx"
title:  "Two City Scheduling"
date: "2020-06-04"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

There are 2N people a company is planning to interview. The cost of flying the i-th person to city A is costs[i][0], and the cost of flying the i-th person to city B is costs[i][1].

Return the minimum cost to fly every person to a city such that exactly N people arrive in each city.

Example 1:

```
Input: [[10,20],[30,200],[400,50],[30,20]]
Output: 110
Explanation: 
The first person goes to city A for a cost of 10.
The second person goes to city A for a cost of 30.
The third person goes to city B for a cost of 50.
The fourth person goes to city B for a cost of 20.

The total minimum cost is 10 + 30 + 50 + 20 = 110 to have half the people interviewing in each city.
```

Note:

- 1 <= costs.length <= 100
- It is guaranteed that costs.length is even.
- 1 <= costs[i][0], costs[i][1] <= 1000

Solution:

```java
class Solution {
    public int twoCitySchedCost(int[][] costs) {
        int sum = 0;
        int n = costs.length;

        Arrays.sort(costs, (a, b) -> {
            return Integer.compare(a[0] - a[1], b[0] - b[1]);
        });

        for (int i = 0; i < n; i++) {
            if (i >= n/2) {
                sum += costs[i][1];
            } else {
                sum += costs[i][0];
            }
        }

        return sum;
    }
}
