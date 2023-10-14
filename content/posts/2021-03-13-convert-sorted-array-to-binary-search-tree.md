---
author: "volyx"
title:  "108. Convert Sorted Array to Binary Search Tree"
date: "2021-03-13"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "binary-tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[108. Convert Sorted Array to Binary Search Tree](https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/)

Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.

A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.

![ex1](/images/2021-03-13-convert-binary-tree-ex1.jpg)

```txt
Example 1:

Input: nums = [-10,-3,0,5,9]
Output: [0,-3,9,-10,null,5]
Explanation: [0,-10,5,null,-3,null,9] is also accepted:
```

![ex2](/images/2021-03-13-convert-binary-tree-ex2.jpg)

```txt
Example 2:

Input: nums = [1,3]
Output: [3,1]
Explanation: [1,3] and [3,1] are both a height-balanced BSTs.
```

![ex3](/images/2021-03-13-convert-binary-tree-ex3.jpg)

Constraints:

- 1 <= nums.length <= 104
- -104 <= nums[i] <= 104
- nums is sorted in a strictly increasing order.

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
    public TreeNode sortedArrayToBST(int[] nums) {
        if (nums.length == 0) return null;
        return buildBST(nums, 0, nums.length - 1);
    }
    
    TreeNode buildBST(int[] nums, int lo, int hi) {
        if (hi < lo) {
            return null;
        }
        TreeNode node = new TreeNode();
        int mid = lo +  (hi  - lo) / 2;
        node.val = nums[mid];
        node.left = buildBST(nums, lo, mid - 1);
        node.right = buildBST(nums, mid + 1, hi);
        return node;
    }
}
```
