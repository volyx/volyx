---
author: "volyx"
title:  "Check If a String Is a Valid Sequence from Root to Leaves Path in a Binary Tree"
date: "2020-05-01"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a binary tree where each path going from the root to any leaf form a valid sequence, check if a given string is a valid sequence in such binary tree. 

We get the given string from the concatenation of an array of integers arr and the concatenation of all values of the nodes along a path results in a sequence in the given binary tree.

Example 1:
![example1" width="300px](/images/2020-05-01-leetcode_testcase_1x300.png)

```
Input: root = [0,1,0,0,1,0,null,null,1,0,0], arr = [0,1,0,1]
Output: true
Explanation: 
The path 0 -> 1 -> 0 -> 1 is a valid sequence (green color in the figure). 
Other valid sequences are: 
0 -> 1 -> 1 -> 0 
0 -> 0 -> 0
```

Example 2:
![alt example2](/images/2020-05-01-leetcode_testcase_2_300x.png)

```
Input: root = [0,1,0,0,1,0,null,null,1,0,0], arr = [0,0,1]
Output: false 
Explanation: The path 0 -> 0 -> 1 does not exist, therefore it is not even a sequence.
```

Example 3:

![alt example3](/images/2020-05-01-leetcode_testcase_3_300x.png)

Input: root = [0,1,0,0,1,0,null,null,1,0,0], arr = [0,1,1]
Output: false
Explanation: The path 0 -> 1 -> 1 is a sequence, but it is not a valid sequence.

```
Constraints:

    1 <= arr.length <= 5000
    0 <= arr[i] <= 9
    Each node's value is between [0 - 9].
```

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
 
 root = [0,1,0,0,1,0,null,null,1,0,0], arr = [0,1,1]
 
 
[0,1,0,0,1,0,null,null,1,0,0]
[0,1,0,1]

          0
        /    \
      1        0
     / \      /  \
   0    1   0   null
  / \    /\
null,1  0,0


[2,9,3,null,1,null,2,null,8]
[2,9,1,8,0]

                2
              /   \
             9     3
              \     \ 
               1     2    
                \    
                 8
 */
class Solution {
    public boolean isValidSequence(TreeNode root, int[] arr) {
        if (root == null) {
            return false;
        }
        return isValidSequence(root, arr, 0);
    }
    
    public boolean isValidSequence(TreeNode node, int[] arr, int index) {
        
        if (node == null) {
            return false;
        }
        
        System.out.printf("index %d, node %d\n", index, node.val);
        
        if (index > arr.length - 1) {
            return false;
        }
        
        if (node.val != arr[index]) {
            return false;
        }
        
        if (node.left == null && node.right == null && index == arr.length - 1) {
            return true;
        } 
           
        return isValidSequence(node.left, arr, index + 1) ||
                isValidSequence(node.right, arr, index + 1);
    }
}
