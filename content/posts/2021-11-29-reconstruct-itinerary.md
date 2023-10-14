---
author: "volyx"
title:  "332. Reconstruct Itinerary"
date: "2021-11-29"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "dfs", "graph", "hierholzer algorithm"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![332. Reconstruct Itinerary](https://leetcode.com/problems/reconstruct-itinerary/)

You are given a list of airline tickets where tickets[i] = [fromi, toi] represent the departure and the arrival airports of one flight. Reconstruct the itinerary in order and return it.

All of the tickets belong to a man who departs from "JFK", thus, the itinerary must begin with "JFK". If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string.

- For example, the itinerary ["JFK", "LGA"] has a smaller lexical order than ["JFK", "LGB"].

You may assume all tickets form at least one valid itinerary. You must use all the tickets once and only once.

![ex1](/images/2021-11-29-reconstruct-itenerary-ex1.jpg)

```txt
Example 1:

Input: tickets = [["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]
Output: ["JFK","MUC","LHR","SFO","SJC"]
```

![ex2](/images/2021-11-29-reconstruct-itenerary-ex2.jpg)

```txt
Example 2:

Input: tickets = [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
Output: ["JFK","ATL","JFK","SFO","ATL","SFO"]
Explanation: Another possible reconstruction is ["JFK","SFO","ATL","JFK","ATL","SFO"] but it is larger in lexical order.
```

Constraints:

- 1 <= tickets.length <= 300
- tickets[i].length == 2
- from_i.length == 3
- to_i.length == 3
- from_i and to_i consist of uppercase English letters.
- from_i != to_i

## Solution DFS + Backtracking

```java
class Solution {
    public List<String> findItinerary(List<List<String>> tickets) {
        Map<String, List<String>> g = new TreeMap<>();
        for (List<String> ticket: tickets) {
            String start = ticket.get(0);
            String end = ticket.get(1);
            g.putIfAbsent(start, new ArrayList<>());
            g.get(start).add(end);
            g.putIfAbsent(end, new ArrayList<>());
        }
        
        for (String key: g.keySet()) {
            List<String> t = g.get(key);
            Collections.sort(t);
            g.put(key, t);
        }
        
        List<String> res = new ArrayList<>();
        findItenary("JFK", g, tickets.size(), res);
        return res;
    }
    
    boolean findItenary(String start, 
                     Map<String, List<String>> g, 
                     int edgeCount, List<String> res) {
        
        List<String> list = g.get(start);
        res.add(start);
        if (list.size() == 0) {
            if (edgeCount == 0) {
                return true;
            }
            return false;
        } else {
            for (int i = 0; i < list.size(); i++) {
                String next = list.remove(i);
                boolean find = findItenary(next, g, edgeCount - 1, res);
                if (find) return true;
                list.add(i, next);
                res.remove(res.size() - 1);
            }
        }
        return false;
    }
}
```

## Short Solution

```java
class Solution {
    public List<String> findItinerary(List<List<String>> tickets) {
        Map<String, PriorityQueue<String>> g = new TreeMap<>();
        for (List<String> ticket: tickets) {
            String start = ticket.get(0);
            String end = ticket.get(1);
            g.computeIfAbsent(start, k -> new PriorityQueue<>()).add(end);
         
        }
        List<String> res = new ArrayList<>();
        visit("JFK", g, res);
        return res;
    }
    
    void visit(String start, Map<String, PriorityQueue<String>> g, List<String> res) {
        
       while (g.containsKey(start) && g.get(start).size() > 0) {
           visit(g.get(start).poll(), g, res);
       }
       res.add(0, start);
    }
}
```
