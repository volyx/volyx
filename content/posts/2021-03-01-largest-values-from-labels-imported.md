---
author: "volyx"
title:  "1090. Largest Values From Labels"
date: "2021-03-01"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "devide-and-conquer"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/largest-values-from-labels/]

We have a set of items: the i-th item has value values[i] and label labels[i].

Then, we choose a subset S of these items, such that:

- |S| <= num_wanted
- For every label L, the number of items in S with label L is <= use_limit.

Return the largest possible sum of the subset S.

```txt
Example 1:

Input: values = [5,4,3,2,1], labels = [1,1,2,2,3], num_wanted = 3, use_limit = 1
Output: 9
Explanation: The subset chosen is the first, third, and fifth item.

Example 2:

Input: values = [5,4,3,2,1], labels = [1,3,3,3,2], num_wanted = 3, use_limit = 2
Output: 12
Explanation: The subset chosen is the first, second, and third item.

Example 3:

Input: values = [9,8,8,7,6], labels = [0,0,0,1,1], num_wanted = 3, use_limit = 1
Output: 16
Explanation: The subset chosen is the first and fourth item.

Example 4:

Input: values = [9,8,8,7,6], labels = [0,0,0,1,1], num_wanted = 3, use_limit = 2
Output: 24
Explanation: The subset chosen is the first, second, and fourth item.
```

Note:

- 1 <= values.length == labels.length <= 20000
- 0 <= values[i], labels[i] <= 20000
- 1 <= num_wanted, use_limit <= values.length

```java
class Solution {
    public int largestValsFromLabels(int[] values, int[] labels, int num_wanted, int use_limit) {
        sort(values, labels);
        int[] labelCount = new int[20001];
        int sum = 0;
        for (int i = values.length - 1; i >= 0 && num_wanted > 0; i--) {
            int label = labels[i];
            if (labelCount[label] < use_limit) {
                sum+= values[i];
                labelCount[label]++;
                num_wanted--;
            }
        }
        
        return sum;
    }
    
    static void sort(int[] values, int[] labels) {
        sort(values, labels, 0, values.length - 1);
    }
    
    static void sort(int[] values, int[] labels, int lo, int hi) {
        if (lo >= hi) {
            return;
        }
        int j = partition(values, labels, lo, hi);
        sort(values, labels, lo, j - 1);
        sort(values, labels, j + 1, hi);
    }
    
    static int partition(int[] values, int[] labels, int lo, int hi) {
        int i = lo;
        int j = hi + 1;
        
        while (true) {
            while (values[++i] < values[lo]) {
                if (i == hi) break;
            }
            while (values[lo] < values[--j]) {
                if (j == lo) break;
            }
            if (i >= j) {
                break;
            }
            swap(values, labels, i, j);
        }
        swap(values, labels, lo, j);
        return j;
    }
    
    static void swap(int[] values, int[] labels, int i, int j) {
        int temp = values[i];
        values[i] = values[j];
        values[j] = temp;
        
        temp = labels[i];
        labels[i] = labels[j];
        labels[j] = temp;
    }
}
