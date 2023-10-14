---
author: "volyx"
title:  " Cheapest Flights Within K Stops"
date: "2020-06-26"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

There are n cities connected by m flights. Each flight starts from city u and arrives at v with a price w.

Now given all the cities and flights, together with starting city src and the destination dst, your task is to find the cheapest price from src to dst with up to k stops. If there is no such route, output -1.

Example 1:
```
Input: 
n = 3, edges = [[0,1,100],[1,2,100],[0,2,500]]
src = 0, dst = 2, k = 1
Output: 200
Explanation: 
The graph looks like this:
```

![exp1](/images/2020-06-26-exp1.png)

The cheapest price from city 0 to city 2 with at most 1 stop costs 200, as marked red in the picture.

Example 2:
```
Input: 
n = 3, edges = [[0,1,100],[1,2,100],[0,2,500]]
src = 0, dst = 2, k = 0
Output: 500
Explanation: 
The graph looks like this:
```

![exp1](/images/2020-06-26-exp2.png)

The cheapest price from city 0 to city 2 with at most 0 stop costs 500, as marked blue in the picture.

 

Constraints:
- The number of nodes n will be in range [1, 100], with nodes labeled from 0 to n - 1.
- The size of flights will be in range [0, n * (n - 1) / 2].
- The format of each flight will be (src, dst, price).
- The price of each flight will be in the range [1, 10000].
- k is in the range of [0, n - 1].
- There will not be any duplicated flights or self cycles.



Solution:

```java
class Solution {
    
    Integer fare = Integer.MAX_VALUE;
    
    public int findCheapestPrice(int n, int[][] flights, int src, int dst, int K) {
        
        Map<Integer, List<Integer>> adj = new HashMap<>();
        int[][] costs = new int[n][n];
        boolean[] visited = new boolean[n];
        
        for (int i = 0; i < flights.length; i++) {
            int[] flight = flights[i];
            
            int a = flight[0];
            int b = flight[1];
            int price = flight[2];
            
            costs[a][b] = price;
            
            List<Integer> aPath = adj.getOrDefault(a, new ArrayList<>());
            aPath.add(b);
            adj.put(a, aPath);          
        
        }
        solve(costs, adj, src, dst, K, 0, visited);
        
        if (fare == Integer.MAX_VALUE) {
            return -1;
        }
        
        return fare;
    }
    
    void solve(int[][] costs, Map<Integer, List<Integer>> adj, int src, int dst,
     int k, int totalCost, boolean[] visited) {
        
        if (k < -1 ) {
            return;
        }
        
        if (src == dst) {
            fare = Math.min(fare, totalCost);
            return;
        }
        
        visited[src] = true;
        for (int j = 0; j < adj.getOrDefault(src, Collections.emptyList()).size(); j++) {
            int nextSrc = adj.get(src).get(j);
           
            if (costs[src][nextSrc] + totalCost < fare && visited[nextSrc] == false) {
                System.out.printf("%d %d%n", src, nextSrc);
                solve(costs, adj, nextSrc, dst, k - 1, costs[src][nextSrc] + totalCost, visited);
            }
        }
        visited[src] = false;
    }
}
