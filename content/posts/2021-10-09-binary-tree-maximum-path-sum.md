---
author: "volyx"
title:  "124. Binary Tree Maximum Path Sum"
date: "2021-10-09"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "tree", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![124. Binary Tree Maximum Path Sum](https://leetcode.com/problems/binary-tree-maximum-path-sum/)

A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root.

The path sum of a path is the sum of the node's values in the path.

Given the root of a binary tree, return the maximum path sum of any path.

```txt
Example 1:

Input: root = [1,2,3]
Output: 6
Explanation: The optimal path is 2 -> 1 -> 3 with a path sum of 2 + 1 + 3 = 6.
```

![ex1](/images/2021-10-09-tree-ex1.jpg)

```txt
Example 2:

Input: root = [-10,9,20,null,null,15,7]
Output: 42
Explanation: The optimal path is 15 -> 20 -> 7 with a path sum of 15 + 20 + 7 = 42.
```

![ex2](/images/2021-10-09-tree-ex2.jpg)

Constraints:

- The number of nodes in the tree is in the range [1, 3 * 104].
- -1000 <= Node.val <= 1000

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
    int maxSum = 0;
    public int maxPathSum(TreeNode root) {
       maxSum = root.val;
       dfs(root);
       return maxSum;
    }
    
    int dfs(TreeNode node) {
        if (node == null) return 0;
        
        int leftSum = Math.max(dfs(node.left), 0);
         // int leftSum = dfs(node.left);
        int rightSum = Math.max(dfs(node.right), 0);
        // int rightSum = dfs(node.right);
        
        int currSum = leftSum + node.val + rightSum;
        
        maxSum = Math.max(currSum, maxSum);
        
        return node.val + Math.max(leftSum, rightSum);
    }
}
```

## Solution 2021-11-22

```java
class Solution {
    int max;
    public int maxPathSum(TreeNode root) {
        if (root == null) return 0;
        max = root.val;
        maxSum(root);
        return max;
    }
    
    int maxSum(TreeNode node) {
        if (node == null) return 0;
        int leftSum = Math.max(maxSum(node.left), 0); // either take left or not
        int rightSum = Math.max(maxSum(node.right), 0); // either take right or not
        int currMax = leftSum + rightSum + node.val;
        max = Math.max(max, currMax);
        return node.val + Math.max(leftSum, rightSum); 
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
    int maxSum = 0;
    public int maxPathSum(TreeNode root) {
        maxSum = root.val;
        dfs(root);
        return maxSum;
    }

    int dfs(TreeNode node) {
        if (node == null) return 0;
        
        int left = Math.max(dfs(node.left), 0);
        int right = Math.max(dfs(node.right), 0);
        
        int currSum = node.val + left + right;
        maxSum = Math.max(maxSum, currSum);
        
        return node.val + Math.max(left, right);
    }
}
```
