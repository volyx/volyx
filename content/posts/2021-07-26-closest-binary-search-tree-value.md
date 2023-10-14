---
author: "volyx"
title:  "270. Closest Binary Search Tree Value"
date: "2021-07-26"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[270. Closest Binary Search Tree Value](https://leetcode.com/problems/closest-binary-search-tree-value/)

Given the root of a binary search tree and a target value, return the value in the BST that is closest to the target.

```txt
Example 1:

Input: root = [4,2,5,1,3], target = 3.714286
Output: 4
```

![ex1](/images/2021-07-26-ex1.jpg)

```txt
Example 2:

Input: root = [1], target = 4.428571
Output: 1
```

Constraints:

- The number of nodes in the tree is in the range [1, 104].
- 0 <= Node.val <= 10^9
- -10^9 <= target <= 10^9

## Solution

```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    
    //////////////// O(logN) ////////////////////////
    public int closestValue(TreeNode root, double target) {
        int closest = root.val;
        while (root != null) {
            if (Math.abs(root.val - target) < Math.abs(closest - target)) {
                closest = root.val;
            } 
            root = root.val > target ? root.left: root.right;
        }
        
        return closest;
    }
    
    //////////////// O(N) ////////////////////////
    int closest;
    double closestDelta;
    public int closestValue2(TreeNode root, double target) {
        closest = root.val;
        closestDelta = Math.abs((double) root.val - target);
        
        find(root, target);
        return closest;
    }
    
    void find(TreeNode node, double target) {
        if (node == null) return;
        
        double currentDelta = Math.abs((double) node.val - target);
        
        if (currentDelta < closestDelta) {
            closest = node.val;
            closestDelta = currentDelta;
        } 
        
        find(node.left, target);
        find(node.right, target);
        
    }

    ///////////// In Order Traversal O(N)
    public int closestValue1(TreeNode root, double target) {
        Deque<TreeNode> deq = new ArrayDeque<>();
        long prev = Long.MIN_VALUE;
        while (deq.size() > 0 || root != null) {
            while (root != null) {
                deq.offerLast(root);
                root = root.left;
            }
            
            root = deq.removeLast();
            
            if (prev <= target && target < root.val) {
                if (Math.abs(target - prev) < Math.abs(target - root.val)) {
                    return (int) prev;
                } else {
                    return root.val;
                }
            } 
            
            prev = root.val;
            root = root.right;
        }
        return (int) prev;
    }
    
}
```

## Solution 2022-01-30

```java
class Solution {
    public int closestValue(TreeNode root, double target) {
        int closest = root.val;
        while (root != null) {
            if (Math.abs(target - root.val) < Math.abs(closest - target)) {
                closest = root.val;
            }
            root = (root.val > target) ? root.left: root.right;
        }
        
        return closest;
    }
}
```
