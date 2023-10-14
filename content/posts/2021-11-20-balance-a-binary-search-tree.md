---
author: "volyx"
title:  "1382. Balance a Binary Search Tree"
date: "2021-11-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "fb", "binary-tree", "BST"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1382. Balance a Binary Search Tree](https://leetcode.com/problems/balance-a-binary-search-tree/)

Given the root of a binary search tree, return a balanced binary search tree with the same node values. If there is more than one answer, return any of them.

A binary search tree is balanced if the depth of the two subtrees of every node never differs by more than 1.

![ex1](/images/2021-11-20-balance-bst-ex1.jpg)

```txt
Example 1:

Input: root = [1,null,2,null,3,null,4,null,null]
Output: [2,1,3,null,null,null,4]
Explanation: This is not the only correct answer, [3,1,4,null,2] is also correct.
```

![ex2](/images/2021-11-20-balance-bst-ex2.jpg)

```txt
Example 2:

Input: root = [2,1,3]
Output: [2,1,3]
```

Constraints:

- The number of nodes in the tree is in the range [1, 10^4].
- 1 <= Node.val <= 10^5

## Solution Recursive

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
    public TreeNode balanceBST(TreeNode root) {
        List<Integer> list = new ArrayList<>();
        
        dfs(root, list);
        
        int n = list.size();
        return buildTree(list, 0, n - 1);
    }
    
    TreeNode buildTree(List<Integer> res, int lo, int hi) {
        
        if (lo > hi) return null;
        
        int mid = lo + (hi - lo) / 2;
        TreeNode node = new TreeNode(res.get(mid));
        node.left = buildTree(res, lo, mid - 1);
        node.right = buildTree(res, mid + 1, hi);
        
        return node;
    }
    
    void dfs(TreeNode node, List<Integer> res) {
        if (node == null) return;
        
        dfs(node.left, res);
        
        res.add(node.val);
        
        dfs(node.right, res);
    }
}
```
