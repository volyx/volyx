---
author: "volyx"
title:  "398. Random Pick Index"
date: "2021-08-23"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "random"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[398. Random Pick Index](https://leetcode.com/problems/random-pick-index/)

Given an integer array nums with possible duplicates, randomly output the index of a given target number. You can assume that the given target number must exist in the array.

Implement the Solution class:

- Solution(int[] nums) Initializes the object with the array nums.
- int pick(int target) Picks a random index i from nums where nums[i] == target. If there are multiple valid i's, then each index should have an equal probability of returning.

```txt
Example 1:

Input
["Solution", "pick", "pick", "pick"]
[[[1, 2, 3, 3, 3]], [3], [1], [3]]
Output
[null, 4, 0, 2]

Explanation
Solution solution = new Solution([1, 2, 3, 3, 3]);
solution.pick(3); // It should return either index 2, 3, or 4 randomly. Each index should have equal probability of returning.
solution.pick(1); // It should return 0. Since in the array only nums[0] is equal to 1.
solution.pick(3); // It should return either index 2, 3, or 4 randomly. Each index should have equal probability of returning.
```

Constraints:

- 1 <= nums.length <= 2 * 104
- -2^31 <= nums[i] <= 2^31 - 1
- target is an integer from nums.
- At most 10^4 calls will be made to pick.

## Solution

```java
class Solution {
    Random random = new Random();
    Map<Integer, List<Integer>> valueCount = new HashMap<>();

    public Solution(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            int num = nums[i];
            List<Integer> indexes = valueCount.getOrDefault(num, new ArrayList<>());
            indexes.add(i);
            valueCount.put(num, indexes);
        }
    }
    
    public int pick(int target) {
        List<Integer> indexes = valueCount.get(target);
        int index = random.nextInt(indexes.size());
        return indexes.get(index);
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * Solution obj = new Solution(nums);
 * int param_1 = obj.pick(target);
 */
```

## Solution 2021-01-29 Reservour sampling

```java
class Solution {
    int[] nums;
    Random random = new Random();
    public Solution(int[] nums) {
        this.nums = nums;
    }
    
    public int pick(int target) {
        int count = 0;
        int id = 0;
        for (int i = 0; i < nums.length; i++) {
            int num = nums[i];
            if (num != target) continue;
            if (random.nextInt(++count) == 0) {
                id = i;
            }
        }
        return id;
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * Solution obj = new Solution(nums);
 * int param_1 = obj.pick(target);
 */
```
