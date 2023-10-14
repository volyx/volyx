---
author: "volyx"
title:  "314. Binary Tree Vertical Order Traversal"
date: "2021-07-22"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "binary-tree", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[314. Binary Tree Vertical Order Traversal](https://leetcode.com/problems/binary-tree-vertical-order-traversal/)

Given the root of a binary tree, return the vertical order traversal of its nodes' values. (i.e., from top to bottom, column by column).

If two nodes are in the same row and column, the order should be from left to right.

```txt
Example 1:

Input: root = [3,9,20,null,null,15,7]
Output: [[9],[3,15],[20],[7]]
```

![ex1](/images/2021-07-22-bt-ex1.jpg)

```txt
Example 2:

Input: root = [3,9,8,4,0,1,7]
Output: [[4],[9],[3,0,1],[8],[7]]
```

![ex2](/images/2021-07-22-bt-ex2.jpg)

```txt
Example 3:

Input: root = [3,9,8,4,0,1,7,null,null,null,2,5]
Output: [[4],[9,5],[3,0,1],[8,2],[7]]
```

![ex3](/images/2021-07-22-bt-ex3.jpg)

```txt
Example 4:

Input: root = []
Output: []
```

Constraints:

- The number of nodes in the tree is in the range [0, 100].
- -100 <= Node.val <= 100

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
    public List<List<Integer>> verticalOrder(TreeNode root) {
        List<List<Pair<Integer, Integer>>> posList = new ArrayList<>();
        List<List<Pair<Integer, Integer>>> negList = new ArrayList<>();
        dfs(root, 0, 0, negList, posList);
        
        return merge(negList, posList);
    }
    
    void dfs(TreeNode node, int row, int col, 
             List<List<Pair<Integer, Integer>>> negList,
             List<List<Pair<Integer, Integer>>> posList
            ) {
        
        if (node == null) return;
        
        if (col >= 0) {
            if (posList.size() == col) {
                posList.add(new ArrayList<>());
            }
            posList.get(col).add(new Pair<>(node.val, row));
        } else {
            int posCol = -col - 1;
            if (negList.size() == posCol) {
                negList.add(new ArrayList<>());
            }
            negList.get(posCol).add(new Pair<>(node.val, row));
        }
        
        dfs(node.left, row + 1, col - 1, negList, posList);
        dfs(node.right, row + 1, col + 1, negList, posList);
    }
    
    List<List<Integer>> merge(List<List<Pair<Integer, Integer>>> negList, 
                              List<List<Pair<Integer, Integer>>> posList) {
        
        List<List<Integer>> res = new ArrayList<>();
        
        for (int i = negList.size() - 1; i >= 0; i--) {
            negList.get(i).sort((a, b) -> a.getValue() - b.getValue());
            res.add(negList.get(i).stream().map(a -> a.getKey()).collect(Collectors.toList()));
        }
        
        for (int i = 0; i < posList.size(); i++) {
            posList.get(i).sort((a, b) -> a.getValue() - b.getValue());
            res.add(posList.get(i).stream().map(a -> a.getKey()).collect(Collectors.toList()));
        }
        return res;
    }
}
```

## Solution 2022-01-26

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
    int min = 0;
    int max = 0;
    public List<List<Integer>> verticalOrder(TreeNode root) {
        List<List<Integer>> res = new ArrayList<>();
        computeRange(root, 0);
        for (int i = min; i <= max; i++) {
            res.add(new ArrayList<>());
        }
        Queue<Integer> qid = new ArrayDeque<>();
        qid.add(- min);
        Queue<TreeNode> q = new ArrayDeque<>();
        q.add(root);
        while (q.size() > 0) {
            TreeNode node = q.poll();
            int id = qid.poll();
            res.get(id).add(node.val);
            
            if (node.left != null) {
                qid.add(id - 1);
                q.add(node.left);
            }
            if (node.right != null) {
                qid.add(id + 1);
                q.add(node.right);
            }
        }
        return res;
    }
    
    
    void computeRange(TreeNode node, int id) {
        if (node == null) return;
        min = Math.min(min, id);
        max = Math.max(max, id);
        computeRange(node.left, id - 1);
        computeRange(node.right, id + 1);
    }
}
```
