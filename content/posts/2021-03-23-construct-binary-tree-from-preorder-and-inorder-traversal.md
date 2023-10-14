---
author: "volyx"
title:  "105. Construct Binary Tree from Preorder and Inorder Traversal"
date: "2021-03-23"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[105. Construct Binary Tree from Preorder and Inorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/)

Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.

```txt
Example 1:

Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
Output: [3,9,20,null,null,15,7]
```

![ex1](/images/2021-03-23-ex1.jpg)

```txt
Example 2:

Input: preorder = [-1], inorder = [-1]
Output: [-1]
```

Constraints:

- 1 <= preorder.length <= 3000
- inorder.length == preorder.length
- -3000 <= preorder[i], inorder[i] <= 3000
- preorder and inorder consist of unique values.
- Each value of inorder also appears in preorder.
- preorder is guaranteed to be the preorder traversal of the tree.
- inorder is guaranteed to be the inorder traversal of the tree.

## Jamboard

![jam1](/images/105_Construct_Binary_Tree_from_Preorder_and_Inorder_Traversal.png)

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
    int[] preorder;
    int preorderIndex; 
    Map<Integer, Integer> order;
                   
    public TreeNode buildTree(int[] preorder, int[] inorder) {
           this.preorder = preorder;
           order = new HashMap<>();
           for (int i = 0; i < inorder.length; i++) {
               order.put(inorder[i], i);
           }
           return build(0, preorder.length - 1);
    }
    
    TreeNode build(int start, int end) {
        if (start > end) return null;
        
        TreeNode node = new TreeNode(preorder[preorderIndex]);
        int pos = order.get(preorder[preorderIndex++]);
        node.left = build(start, pos - 1);
        node.right = build(pos + 1, end);
        
        return node;
    }
    
    public TreeNode buildTree2(int[] preorder, int[] inorder) {
        TreeNode root = new TreeNode(preorder[0]);
        Map<Integer, Integer> order = new HashMap<>();
        for (int i = 0; i < inorder.length; i++) {
            order.put(inorder[i], i);
        }
        for (int i = 1; i < preorder.length; i++) {
            addNode(root, preorder[i], order);
        }
        return root;
    }
    
    void addNode(TreeNode node, int val, Map<Integer, Integer> order) {
        if (order.get(val) < order.get(node.val)) {
            if (node.left == null) {
                node.left = new TreeNode(val);
            } else {
                addNode(node.left, val, order);
            }
        } else {
            if (node.right == null) {
                node.right = new TreeNode(val);
            } else {
                addNode(node.right, val, order);
            }
        }
    }
}
```

## Solution 2022-01-30

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
    int preorderIndex = 0;
    int[] preorder;
    Map<Integer, Integer> order = new HashMap<>();
    public TreeNode buildTree(int[] preorder, int[] inorder) {
        this.preorder = preorder;
        for (int i = 0; i < inorder.length; i++) {
            order.put(inorder[i], i);
        }
        
        return buildTree(0, order.size() - 1);
    }
    
    TreeNode buildTree(int lo, int hi) {
        if (lo > hi) return null;
        TreeNode node = new TreeNode(preorder[preorderIndex]);
        int pos = order.get(preorder[preorderIndex]);
        preorderIndex++;
        System.out.println("pos = " + pos + " lo " + lo + " " + hi);
        node.left = buildTree(lo, pos - 1);
        node.right = buildTree(pos + 1, hi);
        return node;
    }
}
```