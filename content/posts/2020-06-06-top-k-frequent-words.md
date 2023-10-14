---
author: "volyx"
title:  "Top K Frequent Words"
date: "2020-06-06"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a non-empty list of words, return the k most frequent elements.

Your answer should be sorted by frequency from highest to lowest. If two words have the same frequency, then the word with the lower alphabetical order comes first.

```txt
Example 1:

Input: ["i", "love", "leetcode", "i", "love", "coding"], k = 2
Output: ["i", "love"]
Explanation: "i" and "love" are the two most frequent words.
    Note that "i" comes before "love" due to a lower alphabetical order.
```

```txt
Example 2:

Input: ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], k = 4
Output: ["the", "is", "sunny", "day"]
Explanation: "the", "is", "sunny" and "day" are the four most frequent words,
    with the number of occurrence being 4, 3, 2 and 1 respectively.
```

Note:

- You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
- Input words contain only lowercase letters.

Follow up:

- Try to solve it in O(n log k) time and O(n) extra space.

Solution:

```java
class Solution {
    public List<String> topKFrequent(String[] words, int k) {
        Map<String, Integer> map = new HashMap<>();
        for (String word : words) {
            map.put(word, map.getOrDefault(word, 0) + 1);
        }
        PriorityQueue<String> queue = new PriorityQueue<>((a, b) -> {  
           Integer compare = Integer.compare(map.get(a), map.get(b));  
           if (compare != 0) {
               return -compare;
           } 
           return a.compareTo(b);
        });

        for (String word : map.keySet()) {
            queue.add(word);
        }
        List<String> result = new ArrayList<>();
        while (!queue.isEmpty() && k > 0) {
            result.add(queue.poll());
            k--;
        }
        return result;
    }  
}
```

## Solution 2021-09-03

```java
class Solution {
    Queue<int[]> q;
    Map<String, Integer> wordIndex = new HashMap<>();
    String[] words;
    int[][] heap;
    int n = 0;
    int k;
    public List<String> topKFrequent(String[] words, int k) {
        this.q = new PriorityQueue<int[]>((a, b) -> {
            return compare(a, b);
        });
        this.k = k;
        this.words = words;
        Map<Integer, Integer> freq = new HashMap<>();
        
        for (int i = 0; i < words.length; i++) {
            String word = words[i];
            Integer index = wordIndex.get(word);
            if (index == null) {
                index = i;
                wordIndex.put(word, index);
            } 
            
            freq.put(index, freq.getOrDefault(index, 0) + 1);
        }
        
        // System.out.println("freq: " + freq);
        // System.out.println("wordIndex: " + wordIndex);
        
        heap = new int[k + 1][];
        for (var entry: freq.entrySet()) {
            int[] word = new int[] { entry.getKey(), entry.getValue()};
            // System.out.println("word: " + Arrays.toString(word));
            add(word);
            // System.out.println("after : " + Arrays.deepToString(heap));
            // System.out.println("q : " + Arrays.deepToString(q.toArray()));
        }
        
        List<String> res = new ArrayList<>();
        while (size() > 0) {
            // System.out.println("min : " + Arrays.deepToString(heap));
            int[] max = poll();
            int index = max[0];
            res.add(0, words[index]);
        }
        
        return res;
    }
    
    void add(int[] word) {
        // if (n < k) {
        //     heap[++n] = word;
        //     swim(n);
        // } else {
        //     if (compare(word, heap[1]) > 0) {
        //         heap[1] = word;
        //         sink(n);
        //     }
        // }
        q.add(word);
        if (size() > k) {
            poll();
        }
    }
    
    // heap propery - min heap parent < child
    // change if parent > child; j > i
    void swim(int i) {
        int j = i / 2;
        if (j > 0 && compare(heap[i], heap[j]) < 0) {
            swap(i, j);
            swim(j);    
        }
    }
    
    int compare(int[] i, int[] j) {
        int c = Integer.compare(i[1], j[1]);
        if (c == 0) {
            c = - words[i[0]].compareTo(words[j[0]]);
        }
        // System.out.println("\tcompare " + compare + " " + i + " " + j);
        return c;
    }
    
    int[] poll() {
        // int[] max = heap[1];
        // heap[1] = heap[n--];
        // heap[n + 1][0] = -1;
        // heap[n + 1][1] = -1;
        // sink(1);
        // return max;
        return q.poll();
    }
    
    int size() {
        // return n;
        return q.size();
    }
    
    void sink(int i) {
        // System.out.println("\t" + Arrays.deepToString(heap));
        // System.out.println("\tsink " + i);
        int left = 2 * i;
        int right = 2 * i + 1;
        
        int smallest = i;
        if (left < heap.length && compare(heap[smallest], heap[left]) > 0) {
            smallest = left;
        }
        
        if (right < heap.length && compare(heap[smallest], heap[right]) > 0) {
            smallest = right;
        }
        
        if (i != smallest) {
            swap(i, smallest);
            sink(smallest);
        }
    }
    
    void swap(int i, int j) {
        var temp = heap[i];
        heap[i] = heap[j];
        heap[j] = temp;
    }
    
    
    public List<String> topKFrequent2(String[] words, int k) {
        Map<String, Integer> freq = new HashMap<>();
        for (String word: words) {
            freq.put(word, freq.getOrDefault(word, 0) + 1);
        }
        
        TreeSet<String>[] buckets = new TreeSet[words.length + 1];
        
        for (var entry: freq.entrySet()) {
            Integer i = entry.getValue();
            String word = entry.getKey();
            TreeSet<String> bucket = buckets[i];
            if (bucket == null) {
                bucket = new TreeSet<>();
            }
            bucket.add(word);
            buckets[i] = bucket;
        }
        System.out.println(Arrays.deepToString(buckets));
        List<String> res = new ArrayList<>();
        for (int i = buckets.length - 1; i >= 0 && res.size() < k; i--) {
            if (buckets[i] == null) {
                continue;
            }
            
            for (String word: buckets[i]) {
                if (res.size() == k) {
                    break;
                } 
                res.add(word);
            }
        }
        return res;
    }
}
```

## Solution 2021-11-25

```java
class Solution {
    public List<String> topKFrequent(String[] words, int k) {
        Map<String, Integer> freq = new HashMap<>();
        for (String word: words) {
            freq.put(word, freq.getOrDefault(word, 0) + 1);
        }
        
        PriorityQueue<String> q = new PriorityQueue<>((a, b) -> {
           int c = freq.get(a).compareTo(freq.get(b));
            if (c != 0) return c;
            return - a.compareTo(b);
        });
        
        for (var e: freq.entrySet()) {
            q.add(e.getKey());
            if (q.size() > k) {
                q.poll();
            }
        }
        
        List<String> res = new ArrayList<>();
        
        while (q.size() > 0) {
            res.add(0, q.poll());
        }
        
        return res;
    }
}
```
