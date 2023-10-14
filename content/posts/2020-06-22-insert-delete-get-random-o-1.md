---
author: "volyx"
title:  "Insert delete get random O(1)"
date: "2020-06-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Design a data structure that supports all following operations in average O(1) time.

- insert(val): Inserts an item val to the set if not already present.
- remove(val): Removes an item val from the set if present.
- getRandom: Returns a random element from current set of elements. Each element must have the same probability of being returned.

```txt
Example:

// Init an empty set.
RandomizedSet randomSet = new RandomizedSet();

// Inserts 1 to the set. Returns true as 1 was inserted successfully.
randomSet.insert(1);

// Returns false as 2 does not exist in the set.
randomSet.remove(2);

// Inserts 2 to the set, returns true. Set now contains [1,2].
randomSet.insert(2);

// getRandom should return either 1 or 2 randomly.
randomSet.getRandom();

// Removes 1 from the set, returns true. Set now contains [2].
randomSet.remove(1);

// 2 was already in the set, so return false.
randomSet.insert(2);

// Since 2 is the only number in the set, getRandom always return 2.
randomSet.getRandom();
```

Solution:

```java
class RandomizedSet {
    private Random RANDOM = new Random();
    private Map<Integer, Integer> valueToIndex = new HashMap<>();
    private List<Integer> values = new ArrayList<>();

    /** Initialize your data structure here. */
    public RandomizedSet() {
        
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    public boolean insert(int val) {
        Integer index = valueToIndex.get(val);
        if (index != null) {
            return false;
        }
        values.add(val);
        valueToIndex.put(val, values.size() - 1);
        return true;
    }
    
    /** Removes a value from the set. Returns true 
    if the set contained the specified element. */
    public boolean remove(int val) {
        Integer index = valueToIndex.remove(val);
        if (index == null) {
            return false;
        }
        int lastIndex = values.size() - 1;
        if (index != lastIndex) {
            Integer prev = values.get(lastIndex);
            values.set(index, prev);
            valueToIndex.put(prev, index);
        }
        
        values.remove(lastIndex);
        return true;
    }
    
    /** Get a random element from the set. */
    public int getRandom() {
        int index = RANDOM.nextInt(valueToIndex.size());
        return values.get(index);
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * RandomizedSet obj = new RandomizedSet();
 * boolean param_1 = obj.insert(val);
 * boolean param_2 = obj.remove(val);
 * int param_3 = obj.getRandom();
 */
```

## Solution 2022-01-15

```java
class RandomizedSet {
    boolean debug = false;
    Random random = new Random();
    Map<Integer, Integer> valIndex = new HashMap<>();
    Integer[] array = new Integer[2 * 10_000 + 1];
    int size = 0;
    public RandomizedSet() {
        
    }
    
    public boolean insert(int val) {
        if (debug) System.out.println("i " + val);
        Integer index = valIndex.get(val);
        if (index != null) {
            return false;
        }
        array[size] = val;
        size++;
        valIndex.put(val, size - 1);
        if (debug) System.out.println("array " + array + " map " + valIndex);
        return true;
    }
    
    public boolean remove(int val) {
        if (debug) System.out.println("r " + val);
        Integer index = valIndex.remove(val);
        if (index == null) {
            return false;
        } 
        array[index] = array[size - 1];
        array[size - 1] = null;
        size--;
        if (size != 0) {
            valIndex.put(array[index], index);
        }
       
        if (debug) System.out.println("array " + array + " map " + valIndex);
        return true;
    }
    
    public int getRandom() {
        return array[random.nextInt(size)];
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * RandomizedSet obj = new RandomizedSet();
 * boolean param_1 = obj.insert(val);
 * boolean param_2 = obj.remove(val);
 * int param_3 = obj.getRandom();
 */
```
