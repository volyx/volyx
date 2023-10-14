---
author: "volyx"
title:  "427. Construct Quad Tree"
date: "2021-11-30"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "tree", "uber"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![427. Construct Quad Tree](https://leetcode.com/problems/construct-quad-tree/)

Given a n * n matrix grid of 0's and 1's only. We want to represent the grid with a Quad-Tree.

Return the root of the Quad-Tree representing the grid.

Notice that you can assign the value of a node to True or False when isLeaf is False, and both are accepted in the answer.

A Quad-Tree is a tree data structure in which each internal node has exactly four children. Besides, each node has two attributes:

- val: True if the node represents a grid of 1's or False if the node represents a grid of 0's. 
- isLeaf: True if the node is leaf node on the tree or False if the node has the four children.

```java
class Node {
    public boolean val;
    public boolean isLeaf;
    public Node topLeft;
    public Node topRight;
    public Node bottomLeft;
    public Node bottomRight;
}
```

We can construct a Quad-Tree from a two-dimensional area using the following steps:

- If the current grid has the same value (i.e all 1's or all 0's) set isLeaf True and set val to the value of the grid and set the four children to Null and stop.
- If the current grid has different values, set isLeaf to False and set val to any value and divide the current grid into four sub-grids as shown in the photo.
- Recurse for each of the children with the proper sub-grid.

![ex1](/images/2021-11-30-construct-quad-tree-ex1.png)

If you want to know more about the Quad-Tree, you can refer to the wiki.

Quad-Tree format:

The output represents the serialized format of a Quad-Tree using level order traversal, where null signifies a path terminator where no node exists below.

It is very similar to the serialization of the binary tree. The only difference is that the node is represented as a list [isLeaf, val].

If the value of isLeaf or val is True we represent it as 1 in the list [isLeaf, val] and if the value of isLeaf or val is False we represent it as 0.

![ex1-1](/images/2021-11-30-construct-quad-tree-ex1-1.png)

```txt
Example 1:

Input: grid = [[0,1],[1,0]]
Output: [[0,1],[1,0],[1,1],[1,1],[1,0]]
Explanation: The explanation of this example is shown below:
Notice that 0 represnts False and 1 represents True in the photo representing the Quad-Tree.
```

![ex1-2](/images/2021-11-30-construct-quad-tree-ex1-2.png)

![ex2-1](/images/2021-11-30-construct-quad-tree-ex2-1.png)

```txt
Example 2:

Input: grid = [[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0]]
Output: [[0,1],[1,1],[0,1],[1,1],[1,0],null,null,null,null,[1,0],[1,0],[1,1],[1,1]]
Explanation: All values in the grid are not the same. We divide the grid into four sub-grids.
The topLeft, bottomLeft and bottomRight each has the same value.
The topRight have different values so we divide it into 4 sub-grids where each has the same value.
Explanation is shown in the photo below:
```

![ex2-2](/images/2021-11-30-construct-quad-tree-ex2-2png)

```txt
Example 3:

Input: grid = [[1,1],[1,1]]
Output: [[1,1]]
```

```txt
Example 4:

Input: grid = [[0]]
Output: [[1,0]]
```

```txt
Example 5:

Input: grid = [[1,1,0,0],[1,1,0,0],[0,0,1,1],[0,0,1,1]]
Output: [[0,1],[1,1],[1,0],[1,0],[1,1]]
```

Constraints:

- n == grid.length == grid[i].length
- n == 2^x where 0 <= x <= 6

## Solution

```java
/*
// Definition for a QuadTree node.
class Node {
    public boolean val;
    public boolean isLeaf;
    public Node topLeft;
    public Node topRight;
    public Node bottomLeft;
    public Node bottomRight;

    
    public Node() {
        this.val = false;
        this.isLeaf = false;
        this.topLeft = null;
        this.topRight = null;
        this.bottomLeft = null;
        this.bottomRight = null;
    }
    
    public Node(boolean val, boolean isLeaf) {
        this.val = val;
        this.isLeaf = isLeaf;
        this.topLeft = null;
        this.topRight = null;
        this.bottomLeft = null;
        this.bottomRight = null;
    }
    
    public Node(boolean val, boolean isLeaf, Node topLeft, Node topRight, Node bottomLeft, Node bottomRight) {
        this.val = val;
        this.isLeaf = isLeaf;
        this.topLeft = topLeft;
        this.topRight = topRight;
        this.bottomLeft = bottomLeft;
        this.bottomRight = bottomRight;
    }
};
*/

class Solution {
    public Node construct(int[][] grid) {
        return buildTree(0, 0, grid, grid.length); // 4 // 2 // 1
    }
    
    Node buildTree(int row, int col, int[][] array, int size) {
        if (size == 1) {
            return new Node(array[row][col] == 1, true);
        }
        
        /*
        
        00 01 02 03
        10 11 12 13
        20 21 22 23
        30 31 32 33
        
        */
        // 00
        Node leftTop = buildTree(row, col, array, size / 2);
        // 02
        Node rightTop = buildTree(row, col + size / 2, array, size / 2);
        // 22
        Node rightDown = buildTree(row + size / 2, col + size/ 2, array, size / 2);
        // 20
        Node leftDown = buildTree(row + size / 2, col, array, size / 2);
        Node node = new Node(array[row][col] == 1, false);
        
        // function
        if (leftTop.isLeaf && rightTop.isLeaf && leftDown.isLeaf && rightDown.isLeaf && 
        leftTop.val == rightTop.val && leftTop.val == leftDown.val && leftTop.val == rightDown.val) {
            node.isLeaf = true;
            node.val = leftTop.val;
        } else {
            node.topLeft = leftTop;
            node.topRight = rightTop;
            node.bottomRight = rightDown;
            node.bottomLeft = leftDown;
        }
        
        return node;
    }
}
```
