---
author: "volyx"
title:  "98. Validate Binary Search Tree"
date: "2021-05-07"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "bst", "tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[98. Validate Binary Search Tree](https://leetcode.com/problems/validate-binary-search-tree/)

Given the root of a binary tree, determine if it is a valid binary search tree (BST).

A valid BST is defined as follows:

- The left subtree of a node contains only nodes with keys less than the node's key.
- The right subtree of a node contains only nodes with keys greater than the node's key.
- Both the left and right subtrees must also be binary search trees.

```txt
Example 1:

Input: root = [2,1,3]
Output: true
```

![ex1](/images/2021-05-07-ex1.jpg)

```txt
Example 2:

Input: root = [5,1,4,null,null,3,6]
Output: false
Explanation: The root node's value is 5 but its right child's value is 4.
```

![ex2](/images/2021-05-07-ex2.jpg)

Constraints:

- The number of nodes in the tree is in the range [1, 104].
- -231 <= Node.val <= 231 - 1

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
    public boolean isValidBST(TreeNode root) {
        return isValid(root, null, null);
    }
    
    boolean isValid(TreeNode node, Integer low, Integer max) {
        if (node == null) return true;
        
        if (low != null && node.val <= low) return false;
        if (max != null && node.val >= max) return false;
        
        return isValid(node.left, low, node.val) 
            && isValid(node.right, node.val, max);
    }
}
```
