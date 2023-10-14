---
author: "volyx"
title:  "113. Path Sum II"
date: "2021-03-11"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "binary-tree"]
categories: ["leetcode"]
# series: ["binary-tree"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[113. Path Sum II](https://leetcode.com/problems/path-sum-ii/)

Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where each path's sum equals targetSum.

A leaf is a node with no children.

```txt
Example 1:

Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
Output: [[5,4,11,2],[5,8,4,5]]
```

![ex1](/images/2021-03-11-path-sum-2-ex1.jpg)

```txt
Example 2:

Input: root = [1,2,3], targetSum = 5
Output: []
```


![ex1](/images/2021-03-11-path-sum-2-ex2.jpg)

```txt
Example 3:

Input: root = [1,2], targetSum = 0
Output: []
```

Constraints:

- The number of nodes in the tree is in the range [0, 5000].
- -1000 <= Node.val <= 1000
- -1000 <= targetSum <= 1000

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
    
    public boolean isSymmetric(TreeNode root) {
        if (root == null) {
            return true;
        }
        
        List<TreeNode> q = new ArrayList<>();
        q.add(root.left);
        q.add(root.right);
        
        while (q.size() > 1) {
            TreeNode left = q.remove(0);
            TreeNode right = q.remove(0);
            
            if (left == null && left == right) {
                continue;
            }
            
            if (left == null || right == null) {
                return false;
            }
            
            if (left.val != right.val) {
                return false;
            }
            
            q.add(left.left);
            q.add(right.right);
            
            q.add(left.right);
            q.add(right.left);
        }
        
        return true;
    }
    
    public boolean isSymmetricRecursive(TreeNode root) {
        if (root == null) {
            return true;
        }
        
        return isSymmetric(root.left, root.right);
    }
    
    boolean isSymmetric(TreeNode left, TreeNode right) {
        
        if (left == null && right == null) {
            return true;
        }
        
        if (left == null || right == null) {
            return false;
        }
        
        if (left.val != right.val) {
            return false;
        }
        
        return isSymmetric(left.left, right.right) 
            && isSymmetric(right.left, left.right);
    }
}
```
