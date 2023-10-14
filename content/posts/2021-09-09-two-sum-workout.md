---
author: "volyx"
title:  "Two/Three Sum Workout"
date: "2021-09-09"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["coding-workout"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

## Two/Three Sum Workout

https://leetcode.com/problems/two-sum/

```java
class Solution {
    public int[] twoSum(int[] nums, int target) {
        Map<Integer, Integer> valueIndex = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            Integer find = valueIndex.get(target - nums[i]);
            if (find != null) {
                return new int[] {find, i};
            }
            valueIndex.put(nums[i], i);
        }
        return new int[] {-1, -1};
    }
}
```

https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

```java
class Solution {
    public int[] twoSum(int[] numbers, int target) {
        int lo = 0;
        int hi = numbers.length - 1;
        
        while (lo < hi) {
            if (numbers[lo] + numbers[hi] == target) {
                return new int[] {lo + 1, hi + 1};
            } else if (numbers[lo] + numbers[hi] > target) {
                hi--;
            } else {
                lo++;
            }
        }
        return new int[] {-1, -1};
    }
}
```

https://leetcode.com/problems/3sum/

```java
class Solution {
    
    /*
    [-1,0,1,2,-1,-4]
    
    [-4, -1, -1, 0, 1, 2]
    
    
    */
    
    public List<List<Integer>> threeSum(int[] nums) {
        Arrays.sort(nums);
        System.out.println(Arrays.toString(nums));
        int n = nums.length;
        List<List<Integer>> res = new ArrayList<>();
        for (int i = 0; i < n - 2; i++) {
            if (i > 0 && nums[i - 1] == nums[i]) continue;
            int lo = i + 1;
            int hi = n - 1;
            while (lo < hi) {
                int sum = nums[i] + nums[lo] + nums[hi];
                if (sum < 0) {
                   lo++;
                } else if (sum > 0) {
                    hi--;
                } else {
                    res.add(List.of(nums[i], nums[lo], nums[hi]));
                    lo++;
                    hi--;
                    while (lo < hi && nums[lo - 1] == nums[lo]) {
                        lo++;
                    }
                }
            }
        }
        return res;
    }
}
```

https://leetcode.com/problems/3sum-smaller/

```java
class Solution {

    public int threeSumSmaller(int[] nums, int target) {
        Arrays.sort(nums);
        int n = nums.length;
        int count = 0;
        for (int i = 0; i < n - 2; i++) {
            int lo = i + 1;
            int hi = n - 1;
            while (lo < hi) {
                int sum = nums[i] + nums[lo] + nums[hi];
                if (sum < target) {
                    count += hi - lo;
                    lo++;
                } else {
                  hi--;
                }
            }
        }
        return count;
    }
}
```

https://leetcode.com/problems/3sum-closest/