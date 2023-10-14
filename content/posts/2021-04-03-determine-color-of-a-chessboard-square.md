---
author: "volyx"
title:  "1812. Determine Color of a Chessboard Square"
date: "2021-04-03"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1812. Determine Color of a Chessboard Square](https://leetcode.com/problems/determine-color-of-a-chessboard-square/)

You are given coordinates, a string that represents the coordinates of a square of the chessboard. Below is a chessboard for your reference.

![ex1](/images/2021-04-03-chess-ex1.png)

Return true if the square is white, and false if the square is black.

The coordinate will always represent a valid chessboard square. The coordinate will always have the letter first, and the number second.

```txt
Example 1:

Input: coordinates = "a1"
Output: false
Explanation: From the chessboard above, the square with coordinates "a1" is black, so return false.
```

```txt
Example 2:

Input: coordinates = "h3"
Output: true
Explanation: From the chessboard above, the square with coordinates "h3" is white, so return true.
```

```txt
Example 3:

Input: coordinates = "c7"
Output: false
```

Constraints:

- coordinates.length == 2
- 'a' <= coordinates[0] <= 'h'
- '1' <= coordinates[1] <= '8'

## Solution

```java
class Solution {
    public boolean squareIsWhite(String coordinates) {
        int col = coordinates.charAt(0) - 'a';
        int row = coordinates.charAt(1) - '1';
        
        System.out.println(col + " " + row);
        
        if (col % 2 == 0) {
            if (row % 2 != 0) {
                return true; // white
            } else {
                return false;
            }
        } else {
            // h3
            if (row % 2 == 0) {
                return true; // white
            } else {
                return false;
            }
        }
    }
}
```
