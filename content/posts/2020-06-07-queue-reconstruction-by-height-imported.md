---
author: "volyx"
title:  "Queue Reconstruction by Height"
date: "2020-06-07"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Suppose you have a random list of people standing in a queue. Each person is described by a pair of integers (h, k), where h is the height of the person and k is the number of people in front of this person who have a height greater than or equal to h. Write an algorithm to reconstruct the queue.

Note:
The number of people is less than 1,100.
 
```txt
Example

Input:
[[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]

Output:
[[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
```

Solution:

```java
class Solution {
    public int[][] reconstructQueue(int[][] people) {
        Arrays.sort(people, (a,b) -> {
            int compare = Integer.compare(a[0], b[0]);
            if (compare != 0) {
                return -compare;
            }
            return Integer.compare(a[1], b[1]);
        });
        List<int[]> list = new ArrayList<>();
        for (int[] person: people) {
            list.add(person[1], person);
        }
        return list.toArray(new int[0][0]);
    }
}
```

## Solution 2021-10-24

```java
class Solution {

    public int[][] reconstructQueue(int[][] people) {
        Arrays.sort(people, (a, b) -> {
            int r = a[0] - b[0];
            if (r == 0) return a[1] - b[1];
            return -r;
        });
        List<int[]> res = new ArrayList<>();
        for (int[] person: people) {
            int i = 0;
            int before = person[1];
            while (i < res.size() && before > 0) {
                if (res.get(i)[0] >= person[0]) {
                    before--;
                }
                i++;
            }
            res.add(i, person);
        }
        int[][] ans = new int[people.length][2];
        int i = 0;
        for (int[] p: res) {
            ans[i++] = p;
        }
        return ans;
    }
}
```
