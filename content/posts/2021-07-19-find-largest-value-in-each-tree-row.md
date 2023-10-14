---
author: "volyx"
title:  "515. Find Largest Value in Each Tree Row"
date: "2021-07-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "tree", "binary-tree", "dfs", "bfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[515. Find Largest Value in Each Tree Row](https://leetcode.com/problems/find-largest-value-in-each-tree-row/)

Given the root of a binary tree, return an array of the largest value in each row of the tree (0-indexed).

```txt
Example 1:

Input: root = [1,3,2,5,3,null,9]
Output: [1,3,9]

Example 2:

Input: root = [1,2,3]
Output: [1,3]

Example 3:

Input: root = [1]
Output: [1]

Example 4:

Input: root = [1,null,2]
Output: [1,2]

Example 5:

Input: root = []
Output: []
```

![ex1](/images/2021-07-19-ex1.jpg)

Constraints:

- The number of nodes in the tree will be in the range [0, 104].
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
    
    public List<Integer> largestValues(TreeNode root) {
        
        Queue<TreeNode> q = new LinkedList<>();
        
        if (root != null) {
            q.add(root);
        }
        List<Integer> res = new ArrayList<>();
        while (q.size() > 0) {
            
            int size = q.size();
            int max = Integer.MIN_VALUE;
            for (int i = 0; i < size; i++) {
                TreeNode node = q.poll();
                max = Math.max(node.val, max);
                
                if (node.left != null) q.add(node.left);
                if (node.right != null) q.add(node.right);
            }
            
            res.add(max);
        }
        
        return res;
    }
    
    public List<Integer> largestValues2(TreeNode root) {
        List<Integer> res = new ArrayList<>();
        
        dfs(root, res, 0);
        
        return res;
    }
    
    
    void dfs(TreeNode node, List<Integer> res, int level) {
        if (node == null) return;
        
        if (res.size() == level) {
            res.add(node.val);
        }
        
        Integer max = Math.max(res.get(level), node.val);
        res.set(level, max);
        
        dfs(node.left, res, level + 1);
        dfs(node.right, res, level + 1);
    }
}
```

## Solution 2021-10-20

```java
class Solution {
    public List<Integer> largestValues(TreeNode root) {
        
        if (root == null) return Collections.emptyList();
        Queue<TreeNode> q = new ArrayDeque<>();
        List<Integer> res = new ArrayList<>();
        q.add(root);
        while (q.size() > 0) {
            int size = q.size();
            int max = Integer.MIN_VALUE;
            for (int i = 0; i < size; i++) {
                TreeNode node = q.poll();
                max = Math.max(node.val, max);
                if (node.left != null) {
                    q.add(node.left);
                }
                if (node.right != null) {
                    q.add(node.right);
                }
            }
            res.add(max);
        }
        return res;
    }
}
```
