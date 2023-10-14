---
author: "volyx"
title:  "1861. Rotating the Box"
date: "2021-05-15"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "dp"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1861. Rotating the Box](https://leetcode.com/problems/rotating-the-box/)

You are given an m x n matrix of characters box representing a side-view of a box. Each cell of the box is one of the following:

- A stone '#'
- A stationary obstacle '*'
- Empty '.'

The box is rotated 90 degrees clockwise, causing some of the stones to fall due to gravity. Each stone falls down until it lands on an obstacle, another stone, or the bottom of the box. Gravity does not affect the obstacles' positions, and the inertia from the box's rotation does not affect the stones' horizontal positions.

It is guaranteed that each stone in box rests on an obstacle, another stone, or the bottom of the box.

Return an n x m matrix representing the box after the rotation described above.

```txt
Example 1:

Input: box = [["#",".","#"]]
Output: [["."],
         ["#"],
         ["#"]]
```

![ex1](/images/2021-05-15-ex1.png)

```txt
Example 2:

Input: box = [["#",".","*","."],
              ["#","#","*","."]]
Output: [["#","."],
         ["#","#"],
         ["*","*"],
         [".","."]]
```

![ex2](/images/2021-05-15-ex2.png)

```txt
Example 3:

Input: box = [["#","#","*",".","*","."],
              ["#","#","#","*",".","."],
              ["#","#","#",".","#","."]]
Output: [[".","#","#"],
         [".","#","#"],
         ["#","#","*"],
         ["#","*","."],
         ["#",".","*"],
         ["#",".","."]]
```

![ex3](/images/2021-05-15-ex3.png)

Constraints:

- m == box.length
- n == box[i].length
- 1 <= m, n <= 500
- box[i][j] is either '#', '*', or '.'.

## Solution

```java
class Solution {
    public char[][] rotateTheBox(char[][] box) {
        int n = box.length;
        int m = box[0].length;
        
        char[][] res = new char[m][n];
                
        for(int i = 0; i < n; ++i){
            for(int j = m - 1; j >= 0; --j)
                res[j][n-i-1] = box[i][j];
        }

        for (int j = res[0].length - 1; j >= 0; j--) {
            int cut = res.length - 1;
            for (int i = res.length - 1; i >= 0; i--) {
                char c = res[i][j];
                if (c == '*') {
                    cut = i - 1;
                } else if (c == '#') {
                   res[i][j] = '.';
                   res[cut][j] = '#'; 
                   cut--;
                }
            }
        }
        return res;
    }
}
```
