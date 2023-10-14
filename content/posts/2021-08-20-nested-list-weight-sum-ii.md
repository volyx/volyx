---
author: "volyx"
title:  "364. Nested List Weight Sum II"
date: "2021-08-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[364. Nested List Weight Sum II](https://leetcode.com/problems/nested-list-weight-sum-ii/)

You are given a nested list of integers nestedList. Each element is either an integer or a list whose elements may also be integers or other lists.

The depth of an integer is the number of lists that it is inside of. For example, the nested list [1,[2,2],[[3],2],1] has each integer's value set to its depth. Let maxDepth be the maximum depth of any integer.

The weight of an integer is maxDepth - (the depth of the integer) + 1.

Return the sum of each integer in nestedList multiplied by its weight.

```txt
Example 1:

Input: nestedList = [[1,1],2,[1,1]]
Output: 8
Explanation: Four 1's with a weight of 1, one 2 with a weight of 2.
1*1 + 1*1 + 2*2 + 1*1 + 1*1 = 8
```

[ex1](/images/2021-08-20-ex1.png)

```txt
Example 2:

Input: nestedList = [1,[4,[6]]]
Output: 17
Explanation: One 1 at depth 3, one 4 at depth 2, and one 6 at depth 1.
1*3 + 4*2 + 6*1 = 17
```

[ex2](/images/2021-08-20-ex2.png)

Constraints:

- 1 <= nestedList.length <= 50
- The values of the integers in the nested list is in the range [-100, 100].
- The maximum depth of any integer is less than or equal to 50.

## Solution

```java
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * public interface NestedInteger {
 *     // Constructor initializes an empty nested list.
 *     public NestedInteger();
 *
 *     // Constructor initializes a single integer.
 *     public NestedInteger(int value);
 *
 *     // @return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public boolean isInteger();
 *
 *     // @return the single integer that this NestedInteger holds, if it holds a single integer
 *     // Return null if this NestedInteger holds a nested list
 *     public Integer getInteger();
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public void setInteger(int value);
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public void add(NestedInteger ni);
 *
 *     // @return the nested list that this NestedInteger holds, if it holds a nested list
 *     // Return empty list if this NestedInteger holds a single integer
 *     public List<NestedInteger> getList();
 * }
 */
class Solution {
    int max = 0;
    int sum = 0;
    public int depthSumInverse(List<NestedInteger> nestedList) {
        for (NestedInteger nested: nestedList) {
            depth(nested, 1);
        }
        
        // print(nestedList);
        // System.out.println();
        // System.out.println(max);
        
        for (NestedInteger nested: nestedList) {
            sum(nested, 1);
        }
        
        return sum;
    }
    
    void sum(NestedInteger nested, int level) {
        if (nested.isInteger()) {
            sum += (max - level + 1) * nested.getInteger();
            return;
        }
        
        for (NestedInteger child: nested.getList()) {
            sum(child, level + 1);
        }
    }
    
    void depth(NestedInteger nested, int level) {
        max = Math.max(max, level);
        if (nested.isInteger()) {
            return;
        }
        
        for (NestedInteger child: nested.getList()) {
            depth(child, level + 1);
        }
    }
    
    void print(List<NestedInteger> nestedList) {
        for (NestedInteger nested: nestedList) {
            if (nested.isInteger()) {
                System.out.print(nested.getInteger() + " ");
            } else {
                System.out.print("[");
                print(nested.getList());
                 System.out.print("]");
            }
         }
    }
}
```
