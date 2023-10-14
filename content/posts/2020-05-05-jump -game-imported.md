---
author: "volyx"
title:  "Jump Game"
date: "2020-05-05"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given an array of non-negative integers, you are initially positioned at the first index of the array.

Each element in the array represents your maximum jump length at that position.

Determine if you are able to reach the last index.

Example 1:

```txt
Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
```

Example 2:

```txt
Input: nums = [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
```

Constraints:

- 1 <= nums.length <= 3 * 10^4
- 0 <= nums[i][j] <= 10^5

Solution

```java
class Solution {
    public boolean canJump(int[] nums) {
        if (nums.length == 1) {
            return true;
        } 
        boolean[] hops = new boolean[nums.length];
        hops[0] = true;
        for (int i = 0; i < nums.length; i++) {
            if (!hops[i]) {
                return false;
            }
            for (int j = nums[i]; j > 0; j--) {
                if (i + j > nums.length - 1) {
                    continue;
                }     
                hops[i + j] = true;
            }
        }
        return hops[nums.length - 1];
    }
}
 ```

 Solution2

 ```java
 class Solution {
    public boolean canJump(int[] nums) {
        int canReach = 0;
        for (int i = 0; i <= canReach; i++) {
            if (i == nums.length - 1) {
                return true;
            }
            canReach = Math.max(canReach, i + nums[i]);
        }
        return false;
    }
}
```
[Youtube explanation link](https://www.youtube.com/watch?v=muDPTDrpS28)

![example](/images/2020-05-05-jump-image_500x.png)
