---
author: "volyx"
title:  "1379. Find a Corresponding Node of a Binary Tree in a Clone of That Tree"
date: "2021-04-06"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1379. Find a Corresponding Node of a Binary Tree in a Clone of That Tree](https://leetcode.com/problems/find-a-corresponding-node-of-a-binary-tree-in-a-clone-of-that-tree/)

Given two binary trees original and cloned and given a reference to a node target in the original tree.

The cloned tree is a copy of the original tree.

Return a reference to the same node in the cloned tree.

Note that you are not allowed to change any of the two trees or the target node and the answer must be a reference to a node in the cloned tree.

Follow up: Solve the problem if repeated values on the tree are allowed.

```txt
Example 1:

Input: tree = [7,4,3,null,null,6,19], target = 3
Output: 3
Explanation: In all examples the original and cloned trees are shown. The target node is a green node from the original tree. The answer is the yellow node from the cloned tree.
```

![ex1](/images/2021-04-06-cloned-ex1.png)

```txt
Example 2:

Input: tree = [7], target =  7
Output: 7
```

![ex2](/images/2021-04-06-cloned-ex2.png)

```txt
Example 3:

Input: tree = [8,null,6,null,5,null,4,null,3,null,2,null,1], target = 4
Output: 4
```

![ex3](/images/2021-04-06-cloned-ex3.png)

```txt
Example 4:

Input: tree = [1,2,3,4,5,6,7,8,9,10], target = 5
Output: 5
```

![ex4](/images/2021-04-06-cloned-ex4.png)

```txt
Example 5:

Input: tree = [1,2,null,3], target = 2
Output: 2
```

![ex5](/images/2021-04-06-cloned-ex5.png)

Constraints:

- The number of nodes in the tree is in the range [1, 10^4].
- The values of the nodes of the tree are unique.
    target node is a node from the original tree and is not null.

## Solution

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
    TreeNode ans = null;
    public final TreeNode getTargetCopy(
        final TreeNode original, 
        final TreeNode cloned, 
        final TreeNode target) {
        
        if (original == null) return null;
        if (original.val == target.val) {
            ans = cloned;
            return cloned;
        }
        
        getTargetCopy(original.left, cloned.left, target);
        getTargetCopy(original.right, cloned.right, target);
        
        return ans;
    }
}
```
