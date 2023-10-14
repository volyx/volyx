---
author: "volyx"
title:  "451. Sort Characters By Frequency"
date: "2021-03-07"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "heap"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/sort-characters-by-frequency/]

Given a string, sort it in decreasing order based on the frequency of characters.

```txt
Example 1:

Input:
"tree"

Output:
"eert"

Explanation:
'e' appears twice while 'r' and 't' both appear once.
So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.

Example 2:

Input:
"cccaaa"

Output:
"cccaaa"

Explanation:
Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
Note that "cacaca" is incorrect, as the same characters must be together.

Example 3:

Input:
"Aabb"

Output:
"bbAa"
```

Explanation:
"bbaA" is also a valid answer, but "Aabb" is incorrect.
Note that 'A' and 'a' are treated as two different characters.

```java
class Solution {
    int[][] heap;
    int n;
    public String frequencySort(String s) {
        heap = new int[128][];
        Arrays.fill(heap, new int[] {0, 0});
        int[] counts = new int[128];
        for (char c : s.toCharArray()) {
            counts[c]++;
        }
        
        for (int i = 0; i < counts.length; i++) {
            int count = counts[i];
            if (count != 0) {
                heap[++n] = new int[] {i, count};
                swim(n);
            }
        }

        StringBuilder sb = new StringBuilder();
        while (n > 0) {
            int[] val = delMax();
            char c = (char) val[0];
            for (int i = 0; i < val[1]; i++) {
                sb.append(c);
            }
        }
        return sb.toString();
    }
    
    // max heap propery -> parent > child; j > i
    // violates i > j
    void swim(int i) {
        int j = i / 2;
        if (j > 0 && less(j, i)) {
            swap(i, j);
            swim(j);
        }
    }
    
    void sink(int i) {
        int left = 2 * i;
        int right = 2 * i + 1;
        int largest = i;
        if (left < heap.length && !less(left, largest)) {
            largest = left;
        }
        
        if (right < heap.length && !less(right, largest)) {
            largest = right;
        }
        
        if (i != largest) {
            swap(i, largest);
            sink(largest);
        }
    }
    
    boolean less(int i, int j) {
        return heap[i][1] < heap[j][1];
    }
    
    int[] delMax() {
        int[] max = heap[1];
        heap[1] = heap[n--];
        heap[n + 1] = new int[]{0,0};
        sink(1);
        return max;
    }
    
    void swap(int i, int j) {
        int[] temp = heap[i];
        heap[i] = heap[j];
        heap[j] = temp;
    } 
    
    public String frequencySort2(String s) {
        Map<Character, Integer> freq = new HashMap<>();
        char[] symbols = s.toCharArray();
        for (char c: symbols) {
            freq.put(c, freq.getOrDefault(c, 0) + 1);
        }
        
        Queue<Map.Entry<Character, Integer>> q 
            = new PriorityQueue<>((e1, e2) -> -Integer.compare(e1.getValue(), e2.getValue()));
        
        q.addAll(freq.entrySet());
        
        StringBuilder sb = new StringBuilder();
        
         while (!q.isEmpty()) {
            var entry = q.poll();
            // System.out.println(entry);
            for (int i = 0; i < entry.getValue(); i++) {
                sb.append(entry.getKey());
            }
        }
        
        return sb.toString();
    }
}
