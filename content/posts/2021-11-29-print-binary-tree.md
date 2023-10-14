---
author: "volyx"
title:  "655. Print Binary Tree"
date: "2021-11-29"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dfs", "graph", "hierholzer algorithm"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![655. Print Binary Tree](https://leetcode.com/problems/print-binary-tree/)

Given the root of a binary tree, construct a 0-indexed m x n string matrix res that represents a formatted layout of the tree. The formatted layout matrix should be constructed using the following rules:

- The height of the tree is height and the number of rows m should be equal to height + 1.
- The number of columns n should be equal to 2height+1 - 1.
- Place the root node in the middle of the top row (more formally, at location res[0][(n-1)/2]).
- For each node that has been placed in the matrix at position res[r][c], place its left child at res[r+1][c-2height-r-1] and its right child at res[r+1][c+2height-r-1].
- Continue this process until all the nodes in the tree have been placed.
- Any empty cells should contain the empty string "".

Return the constructed matrix res.

![ex1](/images/2021-11-29-print-binary-tree-ex1.jpg)

```txt
Example 1:

Input: root = [1,2]
Output: 
[["","1",""],
 ["2","",""]]
```

![ex2](/images/2021-11-29-print-binary-tree-ex2.jpg)

```txt
Example 2:

Input: root = [1,2,3,null,4]
Output: 
[["","","","1","","",""],
 ["","2","","","","3",""],
 ["","","4","","","",""]]
```

Constraints:

- The number of nodes in the tree is in the range [1, 210].
- -99 <= Node.val <= 99
- The depth of the tree will be in the range [1, 10].

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

    public List<List<String>> printTree(TreeNode root) {
        int maxLevel = level(root);
        List<List<String>> res = new ArrayList<>();
        for (int i = 0; i < maxLevel; i++) {
            res.add(new ArrayList<>());
            for (int j = 0; j < (int) Math.pow(2, maxLevel) - 1; j++) {
                res.get(i).add("");
            }
        }
        int cols = res.get(0).size();
        dfs(0, 0, cols, root, res);
        return res;
    }
    
    int level(TreeNode node) {
        if (node == null) return 0;
        return Math.max(level(node.left), level(node.right)) + 1;
    }
    
    void dfs(int row, int lo, int hi, TreeNode node, List<List<String>> res) {
        if (node == null) return;
        int col = lo + (hi - lo) / 2;
        res.get(row).set(col, node.val + "");
        
        dfs(row + 1, lo, col - 1, node.left, res);
        
        dfs(row + 1, col + 1, hi, node.right, res);
    }
}
```
