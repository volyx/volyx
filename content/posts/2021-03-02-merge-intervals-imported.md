---
author: "volyx"
title:  "56. Merge Intervals"
date: "2021-03-02"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "sort"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/merge-intervals/]

Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

```txt
Example 1:

Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].

Example 2:

Input: intervals = [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.
```

Constraints:

- 1 <= intervals.length <= 104
- intervals[i].length == 2
- 0 <= starti <= endi <= 104

```java
class Solution {
    
    TreeSet<int[]> bst = new TreeSet<>((a, b) -> a[0] - b[0]);
    
    public int[][] merge(int[][] intervals) {
        for (int[] interval: intervals) {
            Iterator<int[]> it = bst.iterator();
            while (it.hasNext()) {
                int[] current = it.next();
                if (isOverlap(current, interval)) {
                    interval = merge(interval, current);
                    it.remove();
                }
            }
            bst.add(interval);
        }
        return toArray(bst);
    }    

    
    public int[][] mergeSort(int[][] intervals) {
        if (intervals.length <= 1) {
            return intervals;
        }
        sort(intervals, 0, intervals.length - 1);
        List<int[]> res = new ArrayList<>();
        int[] current = intervals[0];
        for (int i = 1; i < intervals.length; i++) {
            if (isOverlap(current, intervals[i])) {
                current = merge(current, intervals[i]);
            } else {
                res.add(current);
                current = intervals[i];
            }
        }
        res.add(current);
        return toArray(res);
    }    
    
    void sort(int[][] a, int lo, int hi) {
        if (lo >= hi) {
            return;
        }
        int j = partition(a, lo, hi);
        sort(a, lo, j - 1);
        sort(a, j + 1, hi);
    }
    
    int partition(int[][] a, int lo, int hi) {
        int i = lo;
        int j = hi + 1;
        while (true) {
            while (a[++i][0] < a[lo][0]) {
                if (i == hi) break;
            }
            while (a[lo][0] < a[--j][0]) {
                if (j == lo) break;
            }
            if (i >= j) {
                break;
            }
            swap(a, i, j);
        }
        swap(a, lo, j);
        return j;
    }
    
    void swap(int[][] a, int i, int j) {
        int[] temp = a[i];
        a[i] = a[j];
        a[j] = temp;
    }
    
    public int[][] mergeUf(int[][] intervals) {
        int n = intervals.length;
        UF uf = new UF(n);
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                if (isOverlap(intervals[i], intervals[j])) {
                    uf.union(i, j);
                }
            }
        }

        Map<Integer, int[]> res = new HashMap<>();

        for (int i = 0; i < n; i++) {
            int id = uf.find(i);
            int[] interval = res.get(id);
            if (interval == null) {
                interval = intervals[i];
            } else {
                interval = merge(interval, intervals[i]);
            }
            res.put(id, interval);
        }

        int[][] ans = new int[res.size()][2];
        int i = 0;
        for (int[] interval: res.values()) {
            ans[i++] = interval;
        }
        return ans;
    }
    
    static int[][] toArray(java.util.Collection<int[]> list) {
        int[][] a = new int[list.size()][2];
        int i = 0;
        for (int[] value: list) {
            a[i++] = value;
        }
        return a;
    }

    static int[] merge(int[] a, int[] b) {
        return new int[] {Math.min(a[0], b[0]), Math.max(a[1], b[1])};
    }

    /* 
        a0---------a1
            b0-----------b1

            a0-------a1
        b0--------b1

        a0-----------a1
            b0----b1        

    */
    static boolean isOverlap(int[] a, int[] b) {
        return (a[0] <= b[0] && b[0] <= a[1]) || (a[0] <= b[1] && b[1] <= a[1]) 
            || (b[0] <= a[0] && b[1] >= a[1]);
    }

    class UF {
        int[] a;
        public UF(int n) {
            this.a = new int[n];
            for (int i = 0; i < n; i++) {
                a[i] = i;
            }
        }

        void union(int p, int q) {
            int pid = find(p);
            int qid = find(q);
            if (pid == qid) {
                return;
            }
            a[pid] = qid;
        }
        /* [0,1,0,1,3] */
        int find(int p) {
            while (p != a[p]) {
                a[p] = a[a[p]];
                p = a[p];
            }
            return p;
        }

    }
}
