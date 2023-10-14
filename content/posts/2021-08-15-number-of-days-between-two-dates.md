---
author: "volyx"
title:  "1360. Number of Days Between Two Dates"
date: "2021-08-15"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1360. Number of Days Between Two Dates](https://leetcode.com/problems/number-of-days-between-two-dates/)

Write a program to count the number of days between two dates.

The two dates are given as strings, their format is YYYY-MM-DD as shown in the examples.

```txt
Example 1:

Input: date1 = "2019-06-29", date2 = "2019-06-30"
Output: 1

Example 2:

Input: date1 = "2020-01-15", date2 = "2019-12-31"
Output: 15
```

Constraints:

- The given dates are valid dates between the years 1971 and 2100.

## Solution

```java
import java.time.*;

class Solution {
    
    public int daysBetweenDates(String date1, String date2) {
        return Math.abs(countDays(date1) - countDays(date2));
    }
    
    int [] MONTHS = new int[] {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    int countDays(String date) {
        String[] parts = date.split("-");
        Integer years = Integer.parseInt(parts[0]);
        Integer months = Integer.parseInt(parts[1]);
        Integer days = Integer.parseInt(parts[2]);
        
        for (int year = 1971; year < years; year++) {
            if (isLeapYear(year)) {
                days += 366;
            } else {
                days += 365;
            }
        }
        
        for (int month = 1; month < months; month++) {
            if (isLeapYear(years) && month == 2) {
                days += 29;
            } else {
                days += MONTHS[month];
            }
        }
        
        return days;
    }
    
    boolean isLeapYear(int year) {
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    }
    
    public int daysBetweenDates2(String date1, String date2) {
        
        LocalDateTime time1 = LocalDate.parse(date1).atTime(LocalTime.NOON);
        LocalDateTime time2 = LocalDate.parse(date2).atTime(LocalTime.NOON);
        
        Duration duration = Duration.between(time1, time2);
        
        return (int) Math.abs(duration.toDays());
        
    }
}
```
