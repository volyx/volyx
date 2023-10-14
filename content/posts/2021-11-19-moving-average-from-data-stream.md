---
author: "volyx"
title:  "346. Moving Average from Data Stream"
date: "2021-11-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "fb", "eays", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![346. Moving Average from Data Stream](https://leetcode.com/problems/moving-average-from-data-stream/)

Given two sparse vectors, compute their dot product.

Implement class SparseVector:

- SparseVector(nums) Initializes the object with the vector nums
- dotProduct(vec) Compute the dot product between the instance of SparseVector and vec

A sparse vector is a vector that has mostly zero values, you should store the sparse vector efficiently and compute the dot product between two SparseVector.

Follow up: What if only one of the vectors is sparse?

```txt
Example 1:

Input: nums1 = [1,0,0,2,3], nums2 = [0,3,0,4,0]
Output: 8
Explanation: v1 = SparseVector(nums1) , v2 = SparseVector(nums2)
v1.dotProduct(v2) = 1*0 + 0*3 + 0*0 + 2*4 + 3*0 = 8

Example 2:

Input: nums1 = [0,1,0,0,0], nums2 = [0,0,0,0,2]
Output: 0
Explanation: v1 = SparseVector(nums1) , v2 = SparseVector(nums2)
v1.dotProduct(v2) = 0*0 + 1*0 + 0*0 + 0*0 + 0*2 = 0

Example 3:

Input: nums1 = [0,1,0,0,2,0,0], nums2 = [1,0,0,0,3,0,4]
Output: 6
```

Constraints:

- n == nums1.length == nums2.length
- 1 <= n <= 10^5
- 0 <= nums1[i], nums2[i] <= 100

## Solution HashSet

```java
class SparseVector {
    
    Map<Integer, Integer> map = new TreeMap<>();
    
    SparseVector(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] != 0) {
                map.put(i, nums[i]);
            }
        }
    }
    
    public int dotProduct(SparseVector vec) {
        int sum = 0;
        
        for (Map.Entry<Integer, Integer> e: vec.map.entrySet()) {
            Integer value = this.map.get(e.getKey());
            if (value != null) {
                sum += e.getValue() * value;
            }
        }
        return sum;
    }
}

// Your SparseVector object will be instantiated and called as such:
// SparseVector v1 = new SparseVector(nums1);
// SparseVector v2 = new SparseVector(nums2);
// int ans = v1.dotProduct(v2);
```

## Solution Two Pointers

```java
class SparseVector {
    List<int[]> idx = new ArrayList<>();
    SparseVector(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] != 0) {
                idx.add(new int[] {i, nums[i]});
            }
        }
    }

    public int dotProduct(SparseVector vec) {
        int p1 = 0;
        int p2 = 0;
        int product = 0;
        while (p1 < idx.size() && p2 < vec.idx.size()) {
            if (idx.get(p1)[0] == vec.idx.get(p2)[0]) {
                product += idx.get(p1)[1] * vec.idx.get(p2)[1];
                p1++;
                p2++;
            } else if (idx.get(p1)[0] > vec.idx.get(p2)[0]) {
                p2++;
            } else {
                p1++;
            }
        }
        return product;
    }
}

// Your SparseVector object will be instantiated and called as such:
// SparseVector v1 = new SparseVector(nums1);
// SparseVector v2 = new SparseVector(nums2);
// int ans = v1.dotProduct(v2);
```
