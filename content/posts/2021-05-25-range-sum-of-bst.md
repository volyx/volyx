---
author: "volyx"
title:  "938. Range Sum of BST"
date: "2021-05-25"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "tree", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[938. Range Sum of BST](https://leetcode.com/problems/range-sum-of-bst/)

Given the root node of a binary search tree and two integers low and high, return the sum of values of all nodes with a value in the inclusive range [low, high].

```txt
Example 1:

Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
Output: 32
Explanation: Nodes 7, 10, and 15 are in the range [7, 15]. 7 + 10 + 15 = 32.
```

![ex1](/images/2021-05-25-ex1.jpg)

```txt
Example 2:

Input: root = [10,5,15,3,7,13,18,1,null,6], low = 6, high = 10
Output: 23
Explanation: Nodes 6, 7, and 10 are in the range [6, 10]. 6 + 7 + 10 = 23.
```

![ex2](/images/2021-05-25-ex2.jpg)

Constraints:

- The number of nodes in the tree is in the range [1, 2 * 104].
- 1 <= Node.val <= 105
- 1 <= low <= high <= 105
- All Node.val are unique.

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
    int sum = 0;
    public int rangeSumBST(TreeNode root, int low, int high) {
        rangeSum(root, low, high);
        return sum;
    }
    
    void rangeSum(TreeNode node, int lo, int hi) {
        if (node == null) return;
        if (node.val >= lo && node.val <= hi) {
            sum+=node.val;
        } 
        
        rangeSum(node.left, lo, hi);
        rangeSum(node.right, lo, hi);
    }
}
```

## Solution 2022-01-23 Cut nodes

```java
class Solution {
    public int rangeSumBST(TreeNode root, int low, int high) {
        return rangeSum(root, low, high);
    }
    
    int rangeSum(TreeNode node, int lo, int hi) {
        if (node == null) return 0;
        
        if (lo <= node.val && node.val <= hi) {
            return node.val + rangeSum(node.left, lo, hi) + rangeSum(node.right, lo, hi);
        }
        
        if (node.val < lo) {
            return rangeSum(node.right, lo, hi);
        }
        
        if (node.val > hi) {
            return rangeSum(node.left, lo, hi);
        }
        
        return node.val;
    }
}
```
