---
author: "volyx"
title:  "Maximum Width of Binary Tree"
date: "2020-07-16"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a binary tree, write a function to get the maximum width of the given tree. The maximum width of a tree is the maximum width among all levels.

The width of one level is defined as the length between the end-nodes (the leftmost and right most non-null nodes in the level, where the null nodes between the end-nodes are also counted into the length calculation.

It is guaranteed that the answer will in the range of 32-bit signed integer.

Example 1:
```
Input: 

          1
         / \
        3   2
       / \   \  
      5   3   9 

Output: 4
Explanation: The maximum width existing in the third level with the length 4 (5,3,null,9).
```
Example 2:
```
Input: 

          1
         /  
        3    
       / \       
      5   3     

Output: 2
Explanation: The maximum width existing in the third level with the length 2 (5,3).
```
Example 3:
```
Input: 

          1
         / \
        3   2 
       /        
      5      

Output: 2
Explanation: The maximum width existing in the second level with the length 2 (3,2).
```
Example 4:
```
Input: 

          1
         / \
        3   2
       /     \  
      5       9 
     /         \
    6           7
Output: 8
Explanation:The maximum width existing in the fourth level with the length 8 (6,null,null,null,null,null,null,7).
```
 

Constraints:
- The given binary tree will have between 1 and 3000 nodes.

Notes:
- 


Solution:

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
    Integer max = 0;
    Map<Integer, Integer> leftMostPositions = new HashMap<>();
    public int widthOfBinaryTree(TreeNode root) {
        dfs(root, 0, 0);
        return max;
    }
    
    void dfs(TreeNode node, int depth, int position) {
        if (node == null) {
            return;
        }
        leftMostPositions.computeIfAbsent(depth, x -> position);
        max = Math.max(max, position - leftMostPositions.get(depth) + 1);
        dfs(node.left, depth + 1, position * 2);
        dfs(node.right, depth + 1, position * 2 + 1);
    }
}
