---
author: "volyx"
title:  "1344. Angle Between Hands of a Clock"
date: "2021-05-10"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "number"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1344. Angle Between Hands of a Clock](https://leetcode.com/problems/angle-between-hands-of-a-clock/)

Given two numbers, hour and minutes. Return the smaller angle (in degrees) formed between the hour and the minute hand.

```txt
Example 1:

Input: hour = 12, minutes = 30
Output: 165
```

![ex1](/images/2021-05-10-clock-ex1.png)

```txt
Example 2:

Input: hour = 3, minutes = 30
Output: 75
```

![ex2](/images/2021-05-10-clock-ex2.png)

```txt
Example 3:

Input: hour = 3, minutes = 15
Output: 7.5
```

![ex3](/images/2021-05-10-clock-ex3.png)

```txt
Example 4:

Input: hour = 4, minutes = 50
Output: 155
```

```txt
Example 5:

Input: hour = 12, minutes = 0
Output: 0
```

Constraints:

- 1 <= hour <= 12
- 0 <= minutes <= 59
- Answers within 10^-5 of the actual value will be accepted as correct.

## Solution

```java
class Solution {
    public double angleClock(int hour, int minutes) {
        hour = hour % 12;
        double degree1 = (hour * 60 + minutes) / 60.0 / 12.0 * 360.0;
        double degree2 = (double) minutes / 60.0 * 360.0;
        double diff = Math.abs(degree1 - degree2);
        return Math.min(360.0 - diff, diff);
    }
}
```
