---
author: "volyx"
title:  "LRU Cache"
date: "2020-05-03"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.

get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.

The cache is initialized with a positive capacity.

Follow up:
Could you do both operations in O(1) time complexity?

Example:

```txt
LRUCache cache = new LRUCache( 2 /* capacity */ );

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       // returns 1
cache.put(3, 3);    // evicts key 2
cache.get(2);       // returns -1 (not found)
cache.put(4, 4);    // evicts key 1
cache.get(1);       // returns -1 (not found)
cache.get(3);       // returns 3
cache.get(4);       // returns 4
```

Solution

```java
class LRUCache {
    
    private LinkedList<Node> list = new LinkedList<>();
    private Map<Integer, Node> map = new HashMap<>();
    private int capacity;
    
    public LRUCache(int capacity) {
        this.capacity = capacity;
    }
    
    public int get(int key) {
        if (map.containsKey(key)) {
            Node node = map.get(key);
            list.remove(node);
            list.addFirst(node);
            return node.value;
        } else {
            return -1;
        }
    }
    
    public void put(int key, int value) {
        Node node = null;
        if (map.containsKey(key)) {
            node = map.get(key);
            list.remove(node);
            node.value = value;
        } else {
           if (list.size() == capacity) {
               Node prev = list.pollLast();
               map.remove(prev.key);
           } 
           node = new Node(key, value);
        }
        map.put(key, node);
        list.addFirst(node);
    }
    
    class Node {
        int key, value;
        
        Node(int key, int value) {
            this.key = key;
            this.value = value;
        }
        
        public boolean equals(Node other) {
            return this.key == other.key && this.value == other.value;
        } 
        
        public int hashCode() {
            return Objects.hashCode(this.key) + Objects.hashCode(this.value);
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache obj = new LRUCache(capacity);
 * int param_1 = obj.get(key);
 * obj.put(key,value);
 */
```
