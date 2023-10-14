---
author: "volyx"
title:  "101. Symmetric Tree"
date: "2021-03-11"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "binary-tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

!()[https://leetcode.com/problems/symmetric-tree/]

Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

![ex1](/images/2021-03-11-ex1.jpg)

```txt
Example 1:

Input: root = [1,2,2,3,4,4,3]
Output: true
```

![ex2](/images/2021-03-11-ex2.jpg)

```txt
Example 2:

Input: root = [1,2,2,null,3,null,3]
Output: false
```

Constraints:

- The number of nodes in the tree is in the range [1, 1000].
- -100 <= Node.val <= 100

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
