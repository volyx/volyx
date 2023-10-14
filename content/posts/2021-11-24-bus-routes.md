---
author: "volyx"
title:  "815. Bus Routes"
date: "2021-11-24"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "bfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![815. Bus Routes](https://leetcode.com/problems/https://leetcode.com/problems/word-ladder-ii/)

You are given an array routes representing bus routes where routes[i] is a bus route that the ith bus repeats forever.

- For example, if routes[0] = [1, 5, 7], this means that the 0th bus travels in the sequence 1 -> 5 -> 7 -> 1 -> 5 -> 7 -> 1 -> ... forever.

You will start at the bus stop source (You are not on any bus initially), and you want to go to the bus stop target. You can travel between bus stops by buses only.

Return the least number of buses you must take to travel from source to target. Return -1 if it is not possible.

```txt
Example 1:

Input: routes = [[1,2,7],[3,6,7]], source = 1, target = 6
Output: 2
Explanation: The best strategy is take the first bus to the bus stop 7, then take the second bus to the bus stop 6.

Example 2:

Input: routes = [[7,12],[4,5,15],[6],[15,19],[9,12,13]], source = 15, target = 12
Output: -1
```

Constraints:

- 1 <= routes.length <= 500.
- 1 <= routes[i].length <= 10^5
- All the values of routes[i] are unique.
- sum(routes[i].length) <= 10^5
- 0 <= routes[i][j] < 10^6
- 0 <= source, target < 10^6

## Solution

```java
class Solution {
    Map<Integer, List<Integer>> stationToBus = new HashMap<>();
    
    public int numBusesToDestination(int[][] routes, int source, int target) {
        for (int i = 0; i < routes.length; i++) {
            for (int j = 0; j < routes[i].length; j++) {
                List<Integer> parents = stationToBus.getOrDefault(routes[i][j], new ArrayList<>());
                if (!parents.contains(i)) {
                    parents.add(i);   
                }
                stationToBus.put(routes[i][j], parents);
            }
        }
        
        if (source == target) return 0;
        
        Queue<int[]> q = new ArrayDeque<>();
        q.add(new int[] {source, 0});
        
        Set<Integer> seenBuses = new HashSet<>();
        Set<Integer> seenRoutes = new HashSet<>();
        while (q.size() > 0) {
            int[] stopBus = q.poll();
            int stop = stopBus[0];
            int bus = stopBus[1];
            
            if (stop == target) return bus;
            for (int nextBus: stationToBus.get(stop)) {
                if (seenBuses.add(nextBus)) {
                    for (int newRoute: routes[nextBus]) {
                        if (seenRoutes.add(newRoute)) {
                            q.offer(new int[] {newRoute, bus + 1});
                        }
                    }
                }
            }
        }
        
        return -1;
    }
}
```
