---
author: "volyx"
title:  "1041. Robot Bounded In Circle"
date: "2021-06-03"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1041. Robot Bounded In Circle](https://leetcode.com/problems/robot-bounded-in-circle/)

On an infinite plane, a robot initially stands at (0, 0) and faces north. The robot can receive one of three instructions:

- "G": go straight 1 unit;
- "L": turn 90 degrees to the left;
- "R": turn 90 degrees to the right.

The robot performs the instructions given in order, and repeats them forever.

Return true if and only if there exists a circle in the plane such that the robot never leaves the circle.

```txt
Example 1:

Input: instructions = "GGLLGG"
Output: true
Explanation: The robot moves from (0,0) to (0,2), turns 180 degrees, and then returns to (0,0).
When repeating these instructions, the robot remains in the circle of radius 2 centered at the origin.

Example 2:

Input: instructions = "GG"
Output: false
Explanation: The robot moves north indefinitely.

Example 3:

Input: instructions = "GL"
Output: true
Explanation: The robot moves from (0, 0) -> (0, 1) -> (-1, 1) -> (-1, 0) -> (0, 0) -> ...
```

Constraints:

- 1 <= instructions.length <= 100
- instructions[i] is 'G', 'L' or, 'R'.

## Solution

```java
class Solution {
    
    public boolean isRobotBounded(String instructions) {
         int[][] directions = new int[][] {
             {0,1}, // north
             {1,0}, // east
             {0,-1}, // south
             {-1,0} // west
         };
        
        int x = 0;
        int y = 0;
        int idx = 0;
        
        for (int i: instructions.toCharArray()) {
            if (i == 'L') {
                idx = (idx + 3) % 4;
            } else if (i == 'R') {
                idx = (idx + 1) % 4;
            } else {
                x += directions[idx][0];
                y += directions[idx][1];
            }
        }
        
        // after one cycle:
        // robot returns into initial position
        // or robot doesn't face north
        return (x == 0 && y == 0) || (idx != 0);
    }
    
    public boolean isRobotBounded2(String instructions) {
        char direction = 'G';
        int i = 0;
        int j = 0;
        int n = instructions.length();
        for (int k = 0; k < 4 * n; k++) {
            char c = instructions.charAt(k % n);
            if (c == 'G') {
                if (direction == 'G') {
                    i++;
                } else if (direction == 'L') {
                    j--;
                } else if (direction == 'D') {
                    i--;
                } else if (direction == 'R') {
                   j++;
                }
            } else if (c == 'L') {
                if (direction == 'G') {
                    direction = 'L';
                } else if (direction == 'L') {
                    direction = 'D';
                } else if (direction == 'D') {
                    direction = 'R';
                } else if (direction == 'R') {
                    direction = 'G';
                }
            } else if (c == 'R') {
                if (direction == 'G') {
                    direction = 'R';
                } else if (direction == 'R') {
                    direction = 'D';
                } else if (direction == 'D') {
                    direction = 'L';
                } else if (direction == 'L') {
                    direction = 'G';
                }
            }
        }
        return (i == 0 && j == 0);
    }
}
```
