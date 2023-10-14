---
author: "volyx"
title:  "114. Flatten Binary Tree to Linked List"
date: "2021-03-28"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[114. Flatten Binary Tree to Linked List](https://leetcode.com/problems/flatten-binary-tree-to-linked-list/)

Given the root of a binary tree, flatten the tree into a "linked list":

- The "linked list" should use the same TreeNode class where the right child pointer points to the next node in the list and the left child pointer is always null.
- The "linked list" should be in the same order as a pre-order traversal of the binary tree.

```txt
Example 1:

Input: root = [1,2,5,3,4,null,6]
Output: [1,null,2,null,3,null,4,null,5,null,6]
```

```txt
Example 2:

Input: root = []
Output: []
```

```txt
Example 3:

Input: root = [0]
Output: [0]
```

Constraints:

- The number of nodes in the tree is in the range [0, 2000].
- -100 <= Node.val <= 100

Follow up: Can you flatten the tree in-place (with O(1) extra space)?

## Recursive

![jam1](/images/114_Flatten_Binary_Tree_to_Linked_List_1.png)

## Iterative

![jam2](/images/114_Flatten_Binary_Tree_to_Linked_List_2.png)

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
    public void flatten(TreeNode root) {
        if (root == null) return;
        flatten(root.left);
        flatten(root.right);
        if (root.left == null) return;
        
        TreeNode rightLeaf =  root.left;
        while (rightLeaf.right != null) {
            rightLeaf = rightLeaf.right;
        }
        TreeNode rightBranch = root.right;
        root.right = root.left;
        rightLeaf.right = rightBranch;
        root.left = null;
    }
    
    public void flatten2(TreeNode root) {
        TreeNode node = root;
        while (node != null) {
            if (node.left != null) {
                 // find leftNode last right child
                TreeNode rightLeaf =  node.left;
                while (rightLeaf.right != null) {
                    rightLeaf = rightLeaf.right;
                }
                TreeNode rightBranch = node.right;
                node.right = node.left;
                rightLeaf.right = rightBranch;
                node.left = null;
            }
             node = node.right;
        }
    }
}
```

## Solution 2021-11-22

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
    public void flatten(TreeNode root) {
        TreeNode node = root;
        
        while (node != null) {
            if (node.left != null) {
                TreeNode rightChild = node.right;
                TreeNode leftChild = node.left;
                node.right = leftChild;
                node.left = null;
                
                TreeNode leftRightDown = leftChild;
                while (leftRightDown.right != null) {
                    leftRightDown = leftRightDown.right;
                }
                
                leftRightDown.right = rightChild;
            }
            
            node = node.right;
        }
    }
}
```
