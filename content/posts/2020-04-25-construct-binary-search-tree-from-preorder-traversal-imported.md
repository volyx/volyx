---
author: "volyx"
title:  "Construct Binary Search Tree from Preorder Traversal"
date: "2020-04-25"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Return the root node of a binary search tree that matches the given preorder traversal.

(Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)

Example 1:

Input: [8,5,1,7,10,12]
Output: [8,5,10,1,7,null,12]

![alt example](https://assets.leetcode.com/uploads/2019/03/06/1266.png) 

```
Note:
    1 <= preorder.length <= 100
    The values of preorder are distinct.
```

Dev notes: First solution uses O(n^2) time and space. We find smaller part of the array and greater part, and the recursevilly build subtree.

Second solution uses O(N) time and space. We build tree while we iterating throug array

```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    public TreeNode bstFromPreorder(int[] preorder) {
        if (preorder.length == 0 ) {
            return null;
        }

        int rootValue = preorder[0];

        List<Integer> smaller = new ArrayList<>();
        List<Integer> greater = new ArrayList<>();

        for (int i = 1; i < preorder.length; i++ ) {
            if (preorder[i] < rootValue) {
                smaller.add(preorder[i]);
            } else {
                greater.add(preorder[i]);
            }
        }

        TreeNode root = new TreeNode(rootValue);
        root.left = bstFromPreorder(smaller.stream().mapToInt(i -> i).toArray());
        root.right = bstFromPreorder(greater.stream().mapToInt(i -> i).toArray());
        return root;
    }
}
```

Solution 2

```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {

    public TreeNode bstFromPreorder(int[] preorder, int id, int limit) {
        if (id == preorder.length || preorder[id] > limit) {
            return null;
        }

        int rootValue = preorder[id];
        TreeNode root = new TreeNode(rootValue);
        id++;
        root.left = bstFromPreorder(preorder, id, rootValue);
        root.right = bstFromPreorder(preorder, id, limit);
        return root;
    }

    public TreeNode bstFromPreorder(int[] preorder) {
        if (preorder.length == 0 ) {
            return null;
        }

        return bstFromPreorder(preorder, 0, Integer.MAX_VALUE);
    }
}
