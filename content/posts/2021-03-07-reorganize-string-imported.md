---
author: "volyx"
title:  "767. Reorganize String"
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

![767. Reorganize String](https://leetcode.com/problems/reorganize-string/)

Given a string S, check if the letters can be rearranged so that two characters that are adjacent to each other are not the same.

If possible, output any possible result.  If not possible, return the empty string.

```txt
Example 1:

Input: S = "aab"
Output: "aba"

Example 2:

Input: S = "aaab"
Output: ""
```

Note:

- S will consist of lowercase letters and have length in range [1, 500].

```java
class Solution {
    int n = 0;
    int[][] heap = new int[27][2];
    // Queue<int[]> q = new PriorityQueue<int[]>((a, b) -> -Integer.compare(a[1], b[1]));
    
    public String reorganizeString(String S) {
        int[] freq = new int[26];
        Arrays.fill(heap, new int[] {0, 0});
        
        for (char c: S.toCharArray()) {
            freq[c - 'a']++;
        }
        
        for (int i = 0; i < freq.length; i++) {
            if (freq[i] != 0) {
                add(new int[]{i, freq[i]});
            }
        }
        
        StringBuilder sb = new StringBuilder();
        
        // while (!isEmpty()) {
        while (size() > 1) {    
            int[] a = poll();
            char aa = (char) ('a' + a[0]);
            int[] b = poll();
            char bb = (char) ('a' + b[0]);

            char select;
            if (sb.length() == 0) {
                select = aa;
                a[1]--;
            } else if (sb.charAt(sb.length() - 1) == aa) {
                select = bb;
                b[1]--;
            } else {
                select = aa;
                a[1]--;
            }
           
            sb.append(select);
            if (a[1] != 0) {
                add(a);
            }
            if (b[1] != 0) {
                add(b);
            }
        }
        
        while (!isEmpty()) {
            // System.out.println(Arrays.deepToString(heap));
            var a = poll();
            char aa = (char) ('a' + a[0]);
            if (sb.length() > 0 && sb.charAt(sb.length() - 1) == aa) {
                sb.setLength(0);
                break;
            } else {
                a[1]--;
                sb.append(aa);
                if (a[1] != 0) {
                    // System.out.println("add = " + Arrays.toString(a));
                    add(a);
                }
            }
        }
        
        return sb.toString();
    }
    
    int[] poll() {
        // return q.poll();
        int[] max = Arrays.copyOf(heap[1], 2);
        heap[1][0] = 0;
        heap[1][1] = 0;
        
        
        heap[1][0] = heap[n][0];
        heap[1][1] = heap[n][1];
        
        n--;
        heap[n + 1][0] = 0;
        heap[n + 1][1] = 0;
        sink(1);
        return max;
    }
    
    void add(int[] val) {
        // q.add(val);
        heap[++n] = Arrays.copyOf(val, 2);
        swim(n);
    }
    
    boolean isEmpty() {
        return size() == 0;
    }
    
    int size() {
        return n;
        // return q.size();
    }
    
    // max heap parent > child; j > i
    // wrong j < i
    void swim(int i) {
        int j = i / 2;
        if (j > 0 && less(j, i)) {
            swap(i, j);
            swim(j);
        }
    }
    
    void swap(int i, int j) {
        int[] temp = heap[i];
        heap[i] = heap[j];
        heap[j] = temp;
    }
    
    void sink(int i) {
        int left = 2 * i;
        int right = 2 * i + 1;
        
        int largest = i;
        if (left < heap.length && less(largest, left)) {
            largest = left;
        }
        if (right < heap.length && less(largest, right)) {
            largest = right;
        }
        
        if (largest != i) {
            swap(i, largest);
            sink(largest);
        }
    }
    
    boolean less(int i, int j) {
        return heap[i][1] < heap[j][1];
    }
}
```

## Solution 2022-01-29

```java
class Solution {
    public String reorganizeString(String s) {
        if (s.length() == 0) return "";
        Queue<int[]> heap = buildQHeap(s);

        StringBuilder sb = new StringBuilder();
        while (heap.size() > 0) {
            int[] first = heap.poll();
            if (sb.length() == 0) {
                sb.append((char) ('a' + first[0]));
                first[1]--;
                if (first[1] != 0) {
                    heap.add(first);
                }
            } else {
                int prev = sb.charAt(sb.length() - 1) - 'a';
                if (prev != first[0]) {
                    sb.append((char) ('a' + first[0]));
                    first[1]--;
                    if (first[1] != 0) {
                        heap.add(first);
                    } 
                } else {
                    if (heap.size() == 0) return "";
                    int[] second = heap.poll();
                    sb.append((char) ('a' + second[0]));
                    second[1]--;
                    if (second[1] != 0) {
                        heap.add(second);
                    }
                    heap.add(first);
                }
            }
        }
        return sb.toString();
    }
    
    Queue<int[]> buildHeap(String s) {
        
        int[] freq = new int[26];

        for (char c: s.toCharArray()) {
            int index = (int)(c - 'a');
            freq[index]++;
        }
        Queue<int[]> heap = new PriorityQueue <>((a, b) -> - a[1] + b[1]);
        
        for (int i = 0; i < 26; i++) {
            if (freq[i] > 0) {
                heap.add(new int[] {i, freq[i]});
            }
        }
        return heap;
    }
}
```
