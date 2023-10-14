---
author: "volyx"
title:  "149. Max Points on a Line"
date: "2021-03-16"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "sort"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[149. Max Points on a Line](https://leetcode.com/problems/max-points-on-a-line/)

Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane, return the maximum number of points that lie on the same straight line.

```txt
Example 1:

Input: points = [[1,1],[2,2],[3,3]]
Output: 3
```

![ex1](/images/2021-03-16-ex1.jpg)

```txt
Example 2:

Input: points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
Output: 4
```

![ex2](/images/2021-03-16-ex2.jpg)

Constraints:

- 1 <= points.length <= 300
- points[i].length == 2
- -104 <= xi, yi <= 104
- All the points are unique.


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
