---
author: "volyx"
title:  "981. Time Based Key-Value Store"
date: "2021-10-21"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "hashmap", "binary-search"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![981. Time Based Key-Value Store](https://leetcode.com/problems/time-based-key-value-store/)

Design a time-based key-value data structure that can store multiple values for the same key at different time stamps and retrieve the key's value at a certain timestamp.

Implement the TimeMap class:

- TimeMap() Initializes the object of the data structure.
- void set(String key, String value, int timestamp) Stores the key key with the value value at the given time timestamp.
- String get(String key, int timestamp) Returns a value such that set was called previously, with timestamp_prev <= timestamp. If there are multiple such values, it returns the value associated with the largest timestamp_prev. If there are no values, it returns "".

```txt
Example 1:

Input
["TimeMap", "set", "get", "get", "set", "get", "get"]
[[], ["foo", "bar", 1], ["foo", 1], ["foo", 3], ["foo", "bar2", 4], ["foo", 4], ["foo", 5]]
Output
[null, null, "bar", "bar", null, "bar2", "bar2"]

Explanation
TimeMap timeMap = new TimeMap();
timeMap.set("foo", "bar", 1);  // store the key "foo" and value "bar" along with timestamp = 1.
timeMap.get("foo", 1);         // return "bar"
timeMap.get("foo", 3);         // return "bar", since there is no value corresponding to foo at timestamp 3 and timestamp 2, then the only value is at timestamp 1 is "bar".
timeMap.set("foo", "bar2", 4); // store the key "foo" and value "ba2r" along with timestamp = 4.
timeMap.get("foo", 4);         // return "bar2"
timeMap.get("foo", 5);         // return "bar2"
```

Constraints:

- 1 <= key.length, value.length <= 100
- key and value consist of lowercase English letters and digits.
- 1 <= timestamp <= 107
- All the timestamps timestamp of set are strictly increasing.
- At most 2 * 105 calls will be made to set and get.

## Solution TreeMap

```java
class TimeMap {
    Map<String, TreeMap<Integer, String>> timeMap = new HashMap();
    public TimeMap() {
        
    }
    
    public void set(String key, String value, int timestamp) {
        TreeMap<Integer, String> keyMap = timeMap.get(key);

        if (keyMap == null) {
            keyMap = new TreeMap<>();
        }
        
        keyMap.put(timestamp, value);
        
            
        timeMap.put(key, keyMap);

    }
    
    public String get(String key, int timestamp) {
        TreeMap<Integer, String> keyMap = timeMap.get(key);
            
        if (keyMap == null) {
            return "";
        }
        var entry = keyMap.floorEntry(timestamp);

        if (entry == null) {
            return "";
        }

       return entry.getValue();    
    }
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * TimeMap obj = new TimeMap();
 * obj.set(key,value,timestamp);
 * String param_2 = obj.get(key,timestamp);
 */
```

## Solution Binary Search

```java
class TimeMap {
    Map<String, List<Pair<Integer, String>>> timeMap = new HashMap();
    public TimeMap() {
        
    }
    
    public void set(String key, String value, int timestamp) {
        List<Pair<Integer, String>> keyList = timeMap.get(key);

        if (keyList == null) {
            keyList = new ArrayList<>();
        }
        
        keyList.add(new Pair<>(timestamp, value));
            
        timeMap.put(key, keyList);
    }
    
    public String get(String key, int timestamp) {
        List<Pair<Integer, String>> keyList = timeMap.get(key);
            
        if (keyList == null) {
            return "";
        }
        int find = binarySearch(keyList, timestamp);

        if (find == -1) {
            return "";
        }
        
        Pair<Integer, String> pair = keyList.get(find);

       return pair.getValue();    
    }
    
    int binarySearch(List<Pair<Integer, String>> list, int timestamp) {
        if (list.size() == 0) {
            return -1;
        }
        
        int lo = 0;
        int hi = list.size() - 1;
        // lo......mid...t....hi
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            long val = list.get(mid).getKey();
            if (val == timestamp) {
                return mid;
            } else if (val > timestamp) {
                hi = mid;
            } else {
                lo = mid + 1;
            }
        }
        
        if (lo == 0 && timestamp < list.get(0).getKey()) {
            return -1;
        } 
        
        if (lo > 0) {
            int delta0 = Math.abs(timestamp - list.get(lo - 1).getKey());
            int delta1 = Math.abs(timestamp - list.get(lo).getKey());
            if (delta0 <= delta1) {
                 return lo - 1; 
            }
        }
        
        return lo;
    }
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * TimeMap obj = new TimeMap();
 * obj.set(key,value,timestamp);
 * String param_2 = obj.get(key,timestamp);
 */
 ```
